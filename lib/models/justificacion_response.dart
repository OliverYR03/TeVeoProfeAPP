import 'dart:convert';

import 'justificacion.dart';

class JustificacionResponse {
  JustificacionResponse({
    required this.justificacion,
  });

  List<Justificacion> justificacion;

  factory JustificacionResponse.fromJson(String str) =>
      JustificacionResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JustificacionResponse.fromMap(Map<String, dynamic> json) =>
      JustificacionResponse(
        justificacion: List<Justificacion>.from(
            json["justificacion"].map((x) => Justificacion.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "justificacion":
            List<dynamic>.from(justificacion.map((x) => x.toMap())),
      };
}
