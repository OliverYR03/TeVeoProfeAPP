import 'dart:convert';

class Profesor {
  Profesor(
      {required this.id,
      required this.profesorId,
      required this.nombApellido,
      required this.curso,
      required this.imagen,
      required this.dni,
      required this.aula});

  String id;
  int profesorId;
  String nombApellido;
  String curso;
  String imagen;
  String dni;
  String aula;

  factory Profesor.fromJson(String str) => Profesor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Profesor.fromMap(Map<String, dynamic> json) => Profesor(
        id: json["_id"],
        profesorId: json["profesorId"],
        nombApellido: json["nombApellido"],
        curso: json["curso"],
        imagen: json["imagen"],
        dni: json["dni"],
        aula: json["aula"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "profesorId": profesorId,
        "nombApellido": nombApellido,
        "curso": curso,
        "imagen": imagen,
        "dni": dni,
        "aula": aula
      };
}
