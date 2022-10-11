import 'dart:convert';

import 'profesor.dart';

class ProfesorResponse {
  ProfesorResponse({
    required this.profesor,
  });

  List<Profesor> profesor;

  factory ProfesorResponse.fromJson(String str) =>
      ProfesorResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfesorResponse.fromMap(Map<String, dynamic> json) =>
      ProfesorResponse(
        profesor: List<Profesor>.from(
            json["profesor"].map((x) => Profesor.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "profesor": List<dynamic>.from(profesor.map((x) => x.toMap())),
      };
}
