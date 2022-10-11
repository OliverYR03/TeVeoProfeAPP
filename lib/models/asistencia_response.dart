import 'dart:convert';

import '../models/asistencia.dart';

class AsistenciaResponse {
  AsistenciaResponse({
    required this.asistencia,
  });

  List<Asistencia> asistencia;

  factory AsistenciaResponse.fromJson(String str) =>
      AsistenciaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AsistenciaResponse.fromMap(Map<String, dynamic> json) =>
      AsistenciaResponse(
        asistencia: List<Asistencia>.from(
            json["asistencia"].map((x) => Asistencia.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "asistencia": List<dynamic>.from(asistencia.map((x) => x.toMap())),
      };
}
