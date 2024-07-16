import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../utils/cart_list.dart'; // Import your cartList and CartItem class

class Productscreen extends StatefulWidget {
  const Productscreen({Key? key}) : super(key: key);

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    void addToCart() {
      CartItem newItem = CartItem(
        name: data['name'],
        price: data['price'],
        image: data['img'],
        size: 'M', // Example size, you can change this as per your logic
        quantity: 1, // Example quantity, you can change this as per your logic
      );
      cartList.add(newItem); // Add the item to cartList
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffE4DCD7),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ZoomIn(
                duration: const Duration(seconds: 3),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffE4DCD7),
                  ),
                  child: Image.asset(data['img'], fit: BoxFit.contain),
                ),
              ),
              FadeInLeft(
                duration: const Duration(seconds: 3),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Text(
                        data['name'],
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(width: 120),
                    const Icon(Icons.star),
                    const Text(
                      ' 4.8',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      '(1K Reviews)',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              FadeInRight(
                duration: const Duration(seconds: 3),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 280),
                      child: Text(
                        'Description',
                        style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        data['description'],
                        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              FadeInUp(
                duration: const Duration(seconds: 3),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Text(
                        'Size',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      child: Text(
                        'S',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 25,
                      child: Text(
                        'M',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                      child: Text(
                        'L',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 25,
                      child: Text(
                        'XL',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 25,
                      child: Text(
                        'XXL',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              FadeInUp(
                duration: const Duration(seconds: 3),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                      child: Text(
                        'Price',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Text(
                      '\$ ${data['price']}',
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(width: 60),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/cart');
                        addToCart(); // Call function to add item to cart
                      },
                      child: Container(
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
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
