import 'dart:convert';

class Justificacion {
  Justificacion({
    required this.id,
    required this.justId,
    required this.motivo,
    required this.detalle,
    required this.imagen,
    required this.categoria,
    required this.estado,
    required this.fecha,
  });

  String id;
  int justId;
  String motivo;
  String detalle;
  String imagen;
  String categoria;
  String estado;
  String fecha;

  factory Justificacion.fromJson(String str) =>
      Justificacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Justificacion.fromMap(Map<String, dynamic> json) => Justificacion(
        id: json["_id"],
        justId: json["justId"],
        motivo: json["motivo"],
        detalle: json["detalle"],
        imagen: json["imagen"],
        categoria: json["categoria"],
        estado: json["estado"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "justId": justId,
        "motivo": motivo,
        "detalle": detalle,
        "imagen": imagen,
        "categoria": categoria,
        "estado": estado,
        "fecha": fecha,
      };
}
