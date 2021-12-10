import 'package:demo/models/person_address_contactlist.dart';
import 'package:flutter/material.dart';
import '../models/person.dart';
import '../models/person_with_address.dart';
import '../httpBaseInstances/dio_instance.dart';
import '../models/users.dart';

class ApiWidget extends InheritedWidget {
  Person? _person;
  PersonWithAddress? _personWithAddress;
  PersonWithAddressandContacts? _personWithAddressandContacts;
  User? _user;

  ApiWidget({Key? key, required Widget child}) : super(key: key, child: child);

  static ApiWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ApiWidget>()
        as ApiWidget);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  //so now we would create fxn/methods to call the apis in this class
  Future<dynamic> getPersonData() async {
    try {
      final response = await dio.get("b/61b1d23401558c731cd0fcca");
      if (response.statusCode == 200) {
        var decoded = response.data;
        _person = Person.fromJSon(decoded);
        return _person;
      }
    } catch (e) {
      debugPrint("e = " + e.toString());
    }
  }

  //now we create another fxn/method to call nested person object with address in apiendpoints
  Future<dynamic> getPersonWithAddress() async {
    try {
      final response = await dio.get(
          "b/61b1d23401558c731cd0fcca/1"); //we edited our json, so this is our new url to retreive
      //personwithaddress json from jsonbin.io
      if (response.statusCode == 200) {
        var decoded = response.data;
        _personWithAddress = PersonWithAddress.fromJSon(decoded);
        return _personWithAddress;
      }
    } catch (e) {
      debugPrint("e = " + e.toString());
    }
  }

  //fetch nested object with contactList
  Future<dynamic> getPersonWithAddressandContacts() async {
    try {
      final response = await dio.get("b/61b1d23401558c731cd0fcca/2");
      if (response.statusCode == 200) {
        var decoded = response.data;
        _personWithAddressandContacts =
            PersonWithAddressandContacts.fromJson(decoded);
        return _personWithAddressandContacts;
      }
    } catch (e) {
      debugPrint("e = " + e.toString());
    }
  }

  //fetch nested object , starting with map field value user and its key values
  Future<dynamic> getUsers() async {
    try {
      final response = await dio.get(
          "b/61b1d23401558c731cd0fcca/3"); //we only need the remaining urls as the base is in the dio instance created earlier
      if (response.statusCode == 200) {
        var decoded = response.data;
        _user = User.fromJson(decoded);
        return _user;
      }
    } catch (e) {
      debugPrint("e = " + e.toString());
    }
  }
}
