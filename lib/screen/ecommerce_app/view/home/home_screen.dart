import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

import '../../../utils/name_list.dart';
import '../../../utils/product_list.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        appBar: AppBar(
          backgroundColor: const Color(0xffF8F8F8),
          title: const Text(
            'Search',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  FadeInLeft(
                    duration: const Duration(seconds: 1),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 60,
                      width: 320,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 0.5,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.search,
                            size: 25,
                            color: Colors.grey,
                          ),
                          Text(
                            ' Search...',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  FadeInRight(
                    duration: const Duration(seconds: 5),
                    child: Container(
                      height: 60,
                      width: 69,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 20),
                  FadeInDown(
                    duration: const Duration(seconds: 5),
                    child: Text(
                      'Find Your Style',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    Boxlist.length,
                        (index) => FadeIn(
                      duration: const Duration(seconds: 3),
                      child: box(Boxlist[index]['name'], Boxlist[index]['img']),
                    ),
                  ),
                ),
              ),
              ZoomIn(
                duration: const Duration(seconds: 3),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      height: 240,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      height: 235,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 230,
                      width: 380,
                      decoration: BoxDecoration(
                        color: const Color(0xffF7E7DA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 170, top: 10),
                            child: Text(
                              'new Arrivals',
                              style: GoogleFonts.dancingScript(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 170),
                            child: Text(
                              'Just For You',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Text(
                              '50%\n off',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      'Most Popular',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: List.generate(
                      productlist.length,
                          (index) => FadeInUp(
                        duration: const Duration(seconds: 2),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/product', arguments: productlist[index]);
                          },
                          child: product1(
                            productlist[index]['name'],
                            productlist[index]['img'],
                            productlist[index]['price'],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(
                      productlist1.length,
                          (index) => FadeInUp(
                        duration: const Duration(seconds: 1),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/product', arguments: productlist1[index]);
                          },
                          child: product2(
                            productlist1[index]['name'],
                            productlist1[index]['img'],
                            productlist1[index]['price'],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget box(String name, String img) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    height: 150,
    width: 130,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        const SizedBox(height: 10),
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(img),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}

Widget product1(String name, String img, String price) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Container(
      height: 260,
      width: 180,
      decoration: const BoxDecoration(
        color: Color(0xffFFEBDF),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: CircleAvatar(
              radius: 70,
              backgroundColor: const Color(0xffFFEBDF),
              backgroundImage: AssetImage(img),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              '\$ $price',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget product2(String name, String img, String price) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: 260,
      width: 180,
      decoration: const BoxDecoration(
        color: Color(0xffFFEBDF),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: CircleAvatar(
              radius: 70,
              backgroundColor: const Color(0xffFFEBDF),
              backgroundImage: AssetImage(img),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              '\$ $price',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    ),
  );
}
