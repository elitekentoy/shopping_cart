import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/second_page.dart';

import 'data_class.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Center(
              child: Text(
                'Shopping Cart',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFfefcff),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Consumer<DataClass>(builder: (context, dataClass, child) {
                return Text(
                  '${dataClass.x}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                );
              }),
              const Spacer(),
              const Text(
                "Total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: const Color(0xFF716f72), width: 1)),
                  child: const Icon(Icons.add),
                ),
                onTap: () {
                  if (context.read<DataClass>().x >= 5) {
                    Get.snackbar("Item", "Can not more than this",
                        backgroundColor: Colors.black,
                        colorText: Colors.white,
                        titleText: const Text(
                          "Item",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        messageText: const Text(
                          "Can not be more than this",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ));
                  } else {
                    context.read<DataClass>().incrementX();
                  }
                },
              ),
              const Spacer(),
              Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SecondPage(),
                              transition: Transition.upToDown,
                              duration: const Duration(seconds: 1));
                        },
                        child: const Text(
                          "Next Page",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.skip_next, color: Colors.white)
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
