
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class spleshPage extends StatelessWidget {
  const spleshPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GestureDetector(
              onDoubleTap: () {
                Get.toNamed('/sec');

              },
              child: Container(
                height: 950,
                width: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(

                      'assets/images/new.png'
                    )
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 580,
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      color: Colors.white,
                      child: Center(
                        child: Text('News Upadates',style: TextStyle(
                          fontSize: 22,color: Colors.blue.shade800
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
