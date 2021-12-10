class Person {
  String firstname;
  String lastname;
  int age;

  Person({required this.firstname, required this.lastname, required this.age});

  //deserialization
  //factory used here is the same as using static
  factory Person.fromJSon(Map<String, dynamic> json) {
    return Person(
        firstname: json["firstname"],
        lastname: json["lastname"],
        age: json["age"]);
  }

  //serialization
  Map<String, dynamic> toJson() {
    var map = {
      "firstname": firstname,
      "lastname": lastname,
      "age": age,
    };
    return map;
  }

  @override
  String toString() {
    return "Person [ firstname: $firstname, lastname: $lastname, age : $age ]";
  }
}
