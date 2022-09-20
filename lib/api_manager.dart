import 'dart:convert';

import 'package:http/http.dart ' as http;
import 'package:news_app/SourcesResponse.dart';
import 'package:news_app/news_response.dart';

class ApiManager {
  static const String BASEURL = 'newsapi.org';
  static const String APIKEY = '18aa499101024b58bf1aae1697798b38';
  static Future<SourcesResponse> getNewsSources() async {
    var uri = Uri.https(BASEURL, 'v2/top-headlines/sources',
        {'apikey': APIKEY, 'category': 'sports'});
    var response = await http.get(uri);
    var responseBody = response
        .body; //body that contain data in it,and body's data type is string and we wanna change this data to json we will follow next line
    var json =
        jsonDecode(responseBody); //here we change the data of string to json
    var sourcesResponse = SourcesResponse.fromJson(
        json); // change the json that i get from previous line to my data class
    return sourcesResponse;
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    var uri = Uri.https(
        BASEURL, 'v2/everything', {'apikey': APIKEY, 'sources': sourceId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
