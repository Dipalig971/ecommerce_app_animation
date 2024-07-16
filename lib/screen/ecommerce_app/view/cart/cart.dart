import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../utils/cart_list.dart'; // Import your cartList and CartItem class

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key}) : super(key: key);

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  // Calculate the total amount of the cart
  double get totalAmount {
    double total = 0;
    for (var item in cartList) {
      total += item.price * item.quantity;
    }
    return total;
  }

  // Remove an item from the cart
  void removeItem(int index) {
    setState(() {
      cartList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 70,
                  width: 410,
                  decoration: const BoxDecoration(
                    color: Color(0xffF8F8F8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      const Text(
                        'My Cart',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      const Icon(Icons.shopping_bag)
                    ],
                  ),
                ),
              ),
              ...cartList.asMap().entries.map((entry) {
                int index = entry.key;
                CartItem item = entry.value;
                return FadeInUp(
                  duration: const Duration(seconds: 1),
                  delay: Duration(milliseconds: index * 300),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 180,
                        width: 380,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Row(
                          children: [
                            Container(
                              height: 160,
                              width: 150,
                              decoration: const BoxDecoration(
                                color: Color(0xffE5E5E5),
                              ),
                              child: Image.asset(item.image),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    item.name,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20, left: 20),
                                  child: Text(
                                    'Size : ${item.size}',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    'Quantity : ${item.quantity}',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    'Price : \$${item.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                removeItem(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 120, left: 15),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(color: Color(0xffFFEBDF)),
                                  child: const Icon(Icons.delete_sweep),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              const Divider(),
              FadeInUp(
                duration: const Duration(seconds: 1),
                delay: const Duration(milliseconds: 900),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Total Amount : ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 110,
                    ),
                    Text(
                      "\$${totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        // Implement your checkout logic here
                      },
                      child: Container(
                        height: 70,
                        width: 390,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
