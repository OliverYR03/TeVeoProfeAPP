import 'dart:convert';

import 'home.dart';

class HomeResponse {
  HomeResponse({
    required this.home,
  });

  List<Home> home;

  factory HomeResponse.fromJson(String str) =>
      HomeResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeResponse.fromMap(Map<String, dynamic> json) => HomeResponse(
        home: List<Home>.from(json["home"].map((x) => Home.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "home": List<dynamic>.from(home.map((x) => x.toMap())),
      };
}
