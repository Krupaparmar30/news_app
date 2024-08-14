import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/modal/news_first_modal/news_first_modal.dart';

import '../../controller/news_api_controller/news_api_controller.dart';
import '../../controller/news_api_controller/news_api_controller1/news_api_controller1.dart';
import '../../controller/news_api_controller/news_api_controller3/news_api_controller3.dart';
import '../../controller/news_api_controller/news_api_controller4/news_api_controller4.dart';
import '../../controller/news_api_controller/news_api_controoler2/news_api_controoler2.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsApiController newsApiController = Get.put(NewsApiController());
    final NewsApiController2 newsApiController2 = Get.put(NewsApiController2());
    final NewsApiController3 newsApiController3 = Get.put(NewsApiController3());
    final NewsApiController4 newsApiController4 = Get.put(NewsApiController4());
    final NewsApiController5 newsApiController5 = Get.put(NewsApiController5());

    return DefaultTabController(
      length: 5,
      child: Scaffold(
          backgroundColor: Colors.black,

          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  width: 400,
                  // Height of the container

                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/n1.jpg'))),
                  // Background color for the container
                  child: Center(
                    child: Text(
                      'News Hadlines',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  indicatorPadding: EdgeInsets.zero,
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(text: 'For You'),
                    Tab(text: 'Tesla'),
                    Tab(text: 'Business'),
                    Tab(text: 'Tech'),
                    Tab(text: 'Market & Investments'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  FutureBuilder<NewsFirstModal?>(
                    future: newsApiController.getNews(),
                    builder: (context, snapshot) {
                      NewsFirstModal? apimodal = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData && snapshot.data != null) {
                        final newsModal = snapshot.data!;
                        return ListView.builder(
                          itemCount: newsModal.articles.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                      onDoubleTap: () {

                                        detailList=newsModal;
                                        selIndex = index;
                                        Get.toNamed('/det');
                                      },
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.pink,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(newsModal
                                                    .articles[index]
                                                    .urlToImage))),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 50, left: 10),
                                          child: Text(
                                            "PublishedAt : ${newsModal.articles[index].publishedAt}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 30,left: 30),
                                          child: Text(
                                            "${newsModal.articles[index].reactive}\n",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('No Data'));
                      }
                    },
                  ),
                  FutureBuilder<NewsFirstModal?>(
                    future: newsApiController2.getNews(),
                    builder: (context, snapshot) {
                      NewsFirstModal? secModal = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData && snapshot.data != null) {
                        final secModal = snapshot.data!;
                        return ListView.builder(
                          itemCount: secModal.articles.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child:    Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:150,
                                  width: 600,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      GestureDetector(
                                        onDoubleTap: () {
                                          detailList=secModal;
                                          selIndex = index;
                                          Get.toNamed('/det');
                                        },
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.pink,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(secModal
                                                      .articles[index]
                                                      .urlToImage))),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 40, left: 10),
                                            child: Text(
                                              "PublishedAt : ${secModal.articles[index].publishedAt}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                 ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(bottom: 30,right: 20),
                                            child: Text(
                                              "${secModal.articles[index].reactive}\n",
                                              style:
                                              TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('No Data'));
                      }
                    },
                  ),
                  FutureBuilder<NewsFirstModal?>(
                    future: newsApiController3.getNews(),
                    builder: (context, snapshot) {
                      NewsFirstModal? theModal = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData && snapshot.data != null) {
                        final theModal = snapshot.data!;
                        return ListView.builder(
                          itemCount: theModal.articles.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child:
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                      onDoubleTap: () {
                                        detailList=theModal;
                                        selIndex = index;
                                        Get.toNamed('/det');
                                      },
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.pink,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(theModal
                                                    .articles[index]
                                                    .urlToImage))),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 50, left: 10),
                                          child: Text(
                                            "PublishedAt : ${theModal.articles[index].publishedAt}",
                                            style: TextStyle(
                                                color: Colors.white,
                                              ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 30),
                                          child: Text(
                                            "${theModal.articles[index].reactive}\n",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('No Data'));
                      }
                    },
                  ),
                  FutureBuilder<NewsFirstModal?>(
                    future: newsApiController4.getNews(),
                    builder: (context, snapshot) {
                      NewsFirstModal? frothModal = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData && snapshot.data != null) {
                        final frothModal = snapshot.data!;
                        return ListView.builder(
                          itemCount: frothModal.articles.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                      onDoubleTap: () {
                                        detailList=frothModal;
                                        selIndex = index;
                                        Get.toNamed('/det');
                                      },
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.pink,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(frothModal
                                                    .articles[index]
                                                    .urlToImage))),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 50, left: 10),
                                          child: Text(
                                            "PublishedAt : ${frothModal.articles[index].publishedAt}",
                                            style: TextStyle(
                                                color: Colors.white,
                                               ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 30),
                                          child: Text(
                                            "${frothModal.articles[index].reactive}\n",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('No Data'));
                      }
                    },
                  ),
                  FutureBuilder<NewsFirstModal?>(
                    future: newsApiController5.getNews(),
                    builder: (context, snapshot) {
                      NewsFirstModal? fiveModal = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData && snapshot.data != null) {
                        final fiveModal = snapshot.data!;
                        return ListView.builder(
                          itemCount: fiveModal.articles.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(onDoubleTap: () {
                                      detailList=fiveModal;
                                      selIndex = index;
                                      Get.toNamed('/det');
                                    },
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.pink,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(fiveModal
                                                    .articles[index]
                                                    .urlToImage))),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 50, left: 10),
                                          child: Text(
                                            "PublishedAt : ${fiveModal.articles[index].publishedAt}",
                                            style: TextStyle(
                                                color: Colors.white,
                                             ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 30),
                                          child: Text(
                                            "${fiveModal.articles[index].reactive}\n",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('No Data'));
                      }
                    },
                  ),
                ]),
              ),
            ],
          )),
    );
  }
}

int selIndex = 0;
NewsFirstModal? detailList;
NewsFirstModal? detailList1;
var helper;