import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled8news/Api/api_manger.dart';
import 'package:untitled8news/category/tabs.dart';

import '../model/SourceResponse.dart';

class Category extends StatelessWidget{
  static const String routeName = 'category';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News App',
          style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: FutureBuilder<SourceResponse?>(
        future:ApiManager.getSources() ,
         builder:(context,snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
             return Center(
               child: CircularProgressIndicator(
                 color: Theme
                     .of(context)
                     .primaryColor,
               ),
             );
           } else if (snapshot.hasError) {
             return Column(
               children: [
                 Text("Something went worng"),
                 ElevatedButton(onPressed: () {}, child: Text("Try Agin"))
               ],
             );
           }
           if (snapshot.data?.status != 'ok') {
             return Column(
               children: [
                 Text(snapshot.data?.message ?? ''),
                 ElevatedButton(onPressed: () {}, child: Text("Try Agin"))
               ],
             );
           }
           var sourcesList = snapshot.data?.sources ?? [];
             return TabsContainer(sourcesList: sourcesList);


         }
      ),
    );
  }

}






