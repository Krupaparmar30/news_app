import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/view/news_api_first_page/news_api_first_page_home.dart';
import 'package:news_app/view/news_api_sec_page/news_api_sec_page.dart';
import 'package:news_app/view/splesh/splesh.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => spleshPage(),),
        GetPage(name: '/sec', page: () => Homepage(),),
        GetPage(name: '/det', page:  () => news_api_sec_page(),)
      ],
    );
  }
}
