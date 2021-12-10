import 'package:dio/dio.dart';

//https://api.jsonbin.io/

var options = BaseOptions(
  baseUrl: 'https://api.jsonbin.io/',
  connectTimeout: 1000 * 60, //60 seconds
  receiveTimeout: 1000 * 60, //60 seconds
);
Dio dio = Dio(options);

//we need to import this class in the apiWidget, so 
//we can use the instance of dio

//we already have our baseUrl here, we would only need to add the 
//remaining url endpoints, so as to fetch our data from online dataStore