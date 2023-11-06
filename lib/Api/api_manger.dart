import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled8news/Api/api_constants.dart';
import 'package:untitled8news/model/NewsResponse.dart';

import '../model/SourceResponse.dart';

class ApiManager{

  static Future<SourceResponse?> getSources()async{
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=47a76903f5174eb7afa266f89d891554

 */
  Uri url = Uri.http(ApiConstants.baseUrl,ApiConstants.sourceApi,
  {
    'apiKey':'47a76903f5174eb7afa266f89d891554'
  });
  try {
    var response = await http.get(url);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    return SourceResponse.fromJson(json);
  }catch(e){
    throw e ;
  }
  }
  static Future<NewsResponse?> getNewsBySourceId(String sourceId)async {
    /*
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=47a76903f5174eb7afa266f89d891554
     */
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
      'apiKey':'47a76903f5174eb7afa266f89d891554',
      ' sources': sourceId


    });
    try{
     var response = await http.get(url);
     var bodyString =response.body;
      var json= jsonDecode(bodyString);
       return NewsResponse.fromJson(json);
  }catch(e){
      throw e;
    }
    }
  static Future<NewsResponse?>searchNews (String query)async {
    /*
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=47a76903f5174eb7afa266f89d891554
     */
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
      'apiKey':'47a76903f5174eb7afa266f89d891554',
      ' q': query


    });
    try{
      var response = await http.get(url);
      var bodyString =response.body;
      var json= jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }
  }
