import 'package:flutter/material.dart';
import 'package:news_app/SourcesResponse.dart';
import 'package:news_app/news_response.dart';
import 'package:news_app/news_widget.dart';

import 'api_manager.dart';

class NewsList extends StatelessWidget {
  Sources source;
  NewsList(this.source);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          FutureBuilder<NewsResponse>(
            future: ApiManager.getNewsBySourceId(source.id!),
            builder: (buildcontext, snapShot) {
              if (snapShot.hasError) {
                return Text('${snapShot.error.toString()})');
              } else if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapShot.data;
              if ('error' == data?.status) {
                //
                return Center(child: Text('${data?.message}'));
              }
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return NewsWidget((data?.articles![index])!);
                  },
                  itemCount: data?.articles?.length ?? 0,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
