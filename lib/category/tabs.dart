

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled8news/Api/news_container.dart';
import 'package:untitled8news/category/tab_item.dart';

import '../model/SourceResponse.dart';

class TabsContainer extends StatefulWidget{
  List<Source> sourcesList ;

 TabsContainer({required this.sourcesList,});

  @override
  State<TabsContainer> createState() => _TabsContainerState();
}

class _TabsContainerState extends State<TabsContainer> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
  return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
       children: [
        TabBar(
          onTap: (index){
         selectedIndex = index ;
         setState(() {

         });
          },
          isScrollable: true,
          indicatorColor:Colors.transparent ,
          tabs: widget.sourcesList.map((source) => TabItem(source: source,
              isSelected: selectedIndex == widget.sourcesList.indexOf(source)
          )).toList()


      ),
         Expanded(child: NewsContainer(source: widget.sourcesList[selectedIndex]))
    ],
  ));
  }
}