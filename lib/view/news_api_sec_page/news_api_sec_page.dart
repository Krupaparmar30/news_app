import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/news_api_controller/news_api_controller.dart';
import '../../controller/news_api_controller/news_api_controller1/news_api_controller1.dart';
import '../../modal/news_first_modal/news_first_modal.dart';
import '../news_api_first_page/news_api_first_page_home.dart';

class news_api_sec_page extends StatelessWidget {
  const news_api_sec_page({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsApiController newsApiController = Get.put(NewsApiController());
    final NewsApiController2 newsApiController2 = Get.put(NewsApiController2());


    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder<NewsFirstModal?>(
              future: newsApiController.getNews(),
              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data != null) {

                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          width: 420,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(detailList!
                                      .articles[selIndex].urlToImage))),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Author : ${detailList!.articles[selIndex].author}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Reactive : ${detailList!.articles[selIndex].reactive}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: 500,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 20,
                                  ),
                                  Text(
                                    "PublishedAt : ${detailList!.articles[selIndex].publishedAt}\n",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 20, left: 20),
                                    child: Text(
                                      "${detailList!.articles[selIndex].title}\n",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    "Content",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 10),
                                    child: Text(
                                      "👉 :   ${detailList!.articles[selIndex].content}\n",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 10),
                                    child: Text(
                                      "👉 :  ${detailList!.articles[selIndex].description}\n",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text('No Data'));
                }
              },
            ),


          ],
        ),
      ),
    );
  }
}
