import 'dart:convert';

class Asistencia {
    Asistencia({
        required this.id,
        required this.asistenciaId,
        required this.nombcurso,
        required this.seccioncurso,
        required this.hora,
        required this.imagen,
        required this.categoria,
    });

    String id;
    int asistenciaId;
    String nombcurso;
    String seccioncurso;
    String hora;
    String imagen;
    String categoria;

    factory Asistencia.fromJson(String str) => Asistencia.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Asistencia.fromMap(Map<String, dynamic> json) => Asistencia(
        id: json["_id"],
        asistenciaId: json["asistenciaId"],
        nombcurso: json["nombcurso"],
        seccioncurso: json["seccioncurso"],
        hora: json["hora"],
        imagen: json["imagen"],
        categoria: json["categoria"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "asistenciaId": asistenciaId,
        "nombcurso": nombcurso,
        "seccioncurso": seccioncurso,
        "hora": hora,
        "imagen": imagen,
        "categoria": categoria,
    };
}
