import 'package:demo/apiWidget/apis.dart';
import 'package:flutter/material.dart';
import 'models/person.dart';

//now we call the apiWidget methods here

class MyHomePage extends StatefulWidget {
  final Person? person;

  const MyHomePage({Key? key, this.person}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  //please wait whiles i load to my phone, so we get the retrieve
  //person data on button press to display in the console window below
  //else u can try it in ur own emulator or phone
  //thanks for following through

  //more videos on converting nested json with  lists and objects  would follow
  //after this tutorials, so please stay tuned
  //we got you covered with api communications in flutter

  retrievePersonInfo(context) {
    ApiWidget.of(context).getPersonData().then((value) {
      debugPrint(value.toString());
    });
  }

  //that's all for now, wait while, we run and display content in terminal, or you can try
  //it out on your emulator
  retrievePersonWithAddressInfo(context) {
    ApiWidget.of(context).getPersonWithAddress().then((value) {
      debugPrint(value.toString());
    });
  }

  //that's all for now, wait while, we run and display content in terminal, or you can try
  //it out on your emulator
  retrievePersonWithAddressandContactList(context) {
    ApiWidget.of(context).getPersonWithAddressandContacts().then((value) {
      debugPrint(value.toString());
    });
  }

//that's all for now, wait while, we run and display content in terminal, or you can try
  //it out on your emulator
  retrieveUsersInfo(context) {
    ApiWidget.of(context).getUsers().then((value) {
      debugPrint(value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              retrievePersonInfo(context);
            },
            child: const Text('Retrieve Person Info from API'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              retrievePersonWithAddressInfo(
                  context); //a new fxn created to communicated with apiEndpoint on buttonPressed
            },
            child: const Text('Retrieve PersonWithAddress Info from API'),
          ),
          //we only duplicate the buttons, but assign a different apiCall to it, so that
          //it retrieves the content we need
          //you can check up on further flutter ui design on youtube videos
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              retrievePersonWithAddressandContactList(
                  context); //a new fxn created to communicated with apiEndpoint on buttonPressed
            },
            child: const Text(
                'Retrieve PersonWithAddressAndContactList Info from API'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              retrieveUsersInfo(
                  context); //a new fxn created to communicated with apiEndpoint on buttonPressed
            },
            child: const Text('Retrieve Users Info from API'),
          ),
        ],
      ),
    );
  }
}
