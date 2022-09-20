import 'package:flutter/material.dart';
import 'package:news_app/SourcesResponse.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:news_app/news_list.dart';
import 'package:news_app/source_tab.dart';

class SourcesTab extends StatefulWidget {
  List<Sources> sources;
  SourcesTab(this.sources);

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
          length: widget.sources.length,
          child: Column(
            children: [
              TabBar(
                  onTap: (index) {
                    selectedTab = index;
                    setState(() {});
                  },
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  tabs: widget.sources.map((source) {
                    var isSelected =
                        widget.sources.indexOf(source) == selectedTab;
                    return SourceTab(source, isSelected);
                  }).toList()),
              NewsList(widget.sources[selectedTab]),
            ],
          )),
    );
  }
}
