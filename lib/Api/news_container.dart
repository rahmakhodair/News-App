import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import 'api_manger.dart';

class NewsContainer extends StatelessWidget {
  Source source;
  NewsContainer({required this.source});
  @override
  Widget build(BuildContext context) {

      return FutureBuilder<NewsResponse?>(
          future: ApiManager.searchNews(source.id?? ""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Theme
                    .of(context)
                    .primaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text('Somthing went wrong'),
                  ElevatedButton(onPressed: () {}, child: Text('try Again'))
                ],
              );
            }
            if (snapshot.data?.status != 'ok') {
              return Column(
                children: [
                  Text(snapshot.data?.message ?? ""),
                  ElevatedButton(onPressed: (){} , child: Text(' try Again'))
                ],
              );
            }
            var newsList = snapshot.data?.articles ?? [];
            return ListView.builder(itemBuilder: (context, index) {
              return Text(newsList[index].title ?? '');
            },
              itemCount: newsList.length,
            );
          }


      );


    }
  }
