




import 'package:get/get.dart';
import 'package:news_app/modal/news_first_modal/news_first_modal.dart';

import '../../../helper/news_api_helper/news_api_helper.dart';


class NewsApiController5 extends GetxController {
  NewsApiHelper newsApiHelper = NewsApiHelper();
  Rx<NewsFirstModal?> newsFirstModal = Rx<NewsFirstModal?>(null);

  Future<void> fromMap() async {
    try {
      final data = await newsApiHelper.fetchApiNewsFive();
      newsFirstModal.value =
          NewsFirstModal.fromApi(data as Map<String, dynamic>);
      print(newsFirstModal.value);
    } catch (e) {
      print('Error fetching news: $e');
    }
  }

  Future<NewsFirstModal?> getNews() async {
    return newsFirstModal.value;
  }

  NewsApiController5() {
    fromMap();
  }
}
