//now we extend the person model to include address object, so we retrieve
//a nested json from our Api endpoints

//now we go back to our apiEndpoints and edit it to contain address fields

class Address {
  String location;
  String state;
  String postCode;

  Address(
      {required this.location, required this.state, required this.postCode});

  //deserialization
  factory Address.fromJSon(Map<String, dynamic> json) {
    return Address(
        location: json["location"],
        state: json["State"],
        postCode: json["postCode"]);
  }

  //serialization
  Map<String, dynamic> toJson() {
    var map = {
      "location": location,
      "State": state,
      "postCode": postCode,
    };
    return map;
  }

  @override
  String toString() {
    return "Address [ location: $location, State: $state, postCode: $postCode ]";
  }
}

class PersonWithAddress {
  String firstname;
  String lastname;
  int age;
  Address address;

  PersonWithAddress(
      {required this.firstname,
      required this.lastname,
      required this.age,
      required this.address});

  //deserialization
  //factory used here is the same as using static
  factory PersonWithAddress.fromJSon(Map<String, dynamic> json) {
    return PersonWithAddress(
        firstname: json["firstname"],
        lastname: json["lastname"],
        age: json["age"],
        address: json["address"] != null //we check if address object is null before we retreive it else, 
                                          //we'll get an exception
            ? Address.fromJSon(json["address"])
            : Address(location: "", state: "", postCode: ""));
  }

  //serialization
  Map<String, dynamic> toJson() {
    var map = {
      "firstname": firstname,
      "lastname": lastname,
      "age": age,
      "address": address,
    };
    return map;
  }

  @override
  String toString() {
    return "PersonWithAddress [ firstname: $firstname, lastname: $lastname, age : $age, Address: ${address.toString()} ]";
  }

  //so we call the address.toString in curly braces, to call the toString() of address to append toString() of pwerosn with address
}
