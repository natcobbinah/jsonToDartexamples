//we create a person with address and list of contacts
//now we define properties for both address and contact objects

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

class Contact {
  String contactName;
  String contactPhoneNo;

  Contact({required this.contactName, required this.contactPhoneNo});

  //deserialization
  factory Contact.fromJSON(Map<String, dynamic> json) {
    return Contact(
        contactName: json["contactName"],
        contactPhoneNo: json["contactPhoneNo"]);
  }

  //serialization
  Map<String, dynamic> toJson() {
    var map = {"contactName": contactName, "contactPhoneNo": contactPhoneNo};
    return map;
  }

  @override
  String toString() {
    return "Contacts [ contactName: $contactName, contactPhoneNo : $contactPhoneNo ]";
  }
}

class PersonWithAddressandContacts {
  String firstname;
  String lastname;
  int age;
  Address address;
  List<Contact> contacts;

  PersonWithAddressandContacts(
      {required this.firstname,
      required this.lastname,
      required this.age,
      required this.address,
      required this.contacts});

  //but before we continue with the deserialization and serialization of our json to
  //our dartModel class, we proceed to jsonbin.io to create the json structure which
  //we would be retrieving

  //deserialization
  factory PersonWithAddressandContacts.fromJson(Map<String, dynamic> json) {
    //use recursion to convert contacts into list of contactOjbects
    List<dynamic> contactList = json["contacts"];
    List<Contact> contact =
        []; //we create an empty list[] to keep hold of contacts when we loop through
    if (contactList != null) {
      //we check to see if contactList was not null, then we populate [contacts] with contact content
      for (var contactobj in contactList) {
        contact.add(Contact.fromJSON(contactobj));
      }
    }

    return PersonWithAddressandContacts(
        firstname: json["firstname"],
        lastname: json["lastname"],
        age: json["age"],
        address: json["address"] != null
            ? //we check to see if address object is not null to avoid throwing error
            Address.fromJSon(json["address"])
            : Address(location: "", state: "", postCode: ""),
        contacts: contact);
  }

  //now on button press from my phone, the json object fetched should display in the terminal

  @override
  String toString() {
    return "PersonWithAddressandContacts [firstname: $firstname, lastname: $lastname, age: $age, address : ${address.toString()}, contacts: ${contacts.toString()}]";
  }
}
