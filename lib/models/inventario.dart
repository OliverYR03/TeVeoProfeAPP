
import 'dart:convert';

Inventario inventarioFromJson(String str) => 
    Inventario.fromJson(json.decode(str));

String inventarioToJson(Inventario data) => 
     json.encode(data.toJson());

class Inventario {
    Inventario({
        required this.inventarioId,
        required this.codasistencia,
        required this.nomasistencia,
        required this.seccion,
        required this.hora,
    });

    int inventarioId;
    String codasistencia;
    String nomasistencia;
    String seccion;
    String hora;

    factory Inventario.fromJson(Map<String, dynamic> json) => 
     Inventario(
        inventarioId: json["inventarioId"],
        codasistencia: json["codasistencia"],
        nomasistencia: json["nomasistencia"],
        seccion: json["seccion"],
        hora: json["hora"],
      );

    Map<String, dynamic> toJson() => {
        "inventarioId": inventarioId,
        "codasistencia": codasistencia,
        "nomasistencia": nomasistencia,
        "seccion": seccion,
        "hora": hora,
    };
}
