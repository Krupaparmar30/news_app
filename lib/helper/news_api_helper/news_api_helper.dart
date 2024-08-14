import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NewsApiHelper {
  Future<Map> fetchApiNewsFirst() async {
    String api =
        "https://newsapi.org/v2/everything?q=apple&from=2024-08-12&to=2024-08-12&sortBy=popularity&apiKey=e823366ebb9541abaef967458a713623";

    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      Map data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchApiNewsSec() async {
    String api1 =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-07-13&sortBy=publishedAt&apiKey=e823366ebb9541abaef967458a713623";
    Uri url = Uri.parse(api1);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      Map data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchApiNewsThird() async {
    String api2 =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e823366ebb9541abaef967458a713623";
    Uri url = Uri.parse(api2);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      Map data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchApiNewsFourth() async {
    String api3 =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e823366ebb9541abaef967458a713623";
    Uri url = Uri.parse(api3);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      Map data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchApiNewsFive() async {
    String api4 =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=e823366ebb9541abaef967458a713623";
    Uri url = Uri.parse(api4);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      Map data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }
}
