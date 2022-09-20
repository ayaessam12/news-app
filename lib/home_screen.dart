import 'package:flutter/material.dart';
import 'package:news_app/SourcesResponse.dart';

import 'package:news_app/api_manager.dart';
import 'package:news_app/sources_tab.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Column(
        children: [
          FutureBuilder<SourcesResponse>(
              future: ApiManager.getNewsSources(),
              builder: (buildContext, snapShot) {
                //3ayznha trg3lna eh? sourceResponse w hn7tag function 2li btrg3 el future 2li hya api manager
                if (snapShot.hasError) {
                  return Text('${snapShot.error.toString()})');
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var data = snapShot.data;
                if ('error' == data?.status) {
                  //
                  return Center(child: Text('${data?.message}'));
                }
                var sources = data?.sources;
                return SourcesTab(sources!);
              })
        ],
      ),
    );
  }
}
