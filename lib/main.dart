import 'package:flutter/material.dart';
import 'apiWidget/apis.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //we make apiWidget parentClass here, so that all sub classes, which inherit it, can make
  //use of the apiEndpoints defined in it

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ApiWidget(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );
  }
}
