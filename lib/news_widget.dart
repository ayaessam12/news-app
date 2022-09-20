import 'package:flutter/material.dart';
import 'package:news_app/news_list.dart';
import 'package:news_app/news_response.dart';

class NewsWidget extends StatelessWidget {
   Articles news;
  NewsWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(news.urlToImage??"",
         height: 120,width: double.infinity,
            fit:BoxFit.cover,),
          Text(news.author??""),
          Text(news.title??""),
          Text(news.publishedAt??""),


        ],
        
      ),
    );
  }
}
