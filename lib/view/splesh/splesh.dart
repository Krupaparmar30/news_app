
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class spleshPage extends StatelessWidget {
  const spleshPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onDoubleTap: () {
              Get.toNamed('/sec');

            },
            child: Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(

                    'assets/images/new.png'
                  )
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
