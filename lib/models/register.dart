import 'dart:convert';

class Register {
    Register({
      required this.id,
      required this.registerId,
      required this.nombApellido,
      required this.pass,
      required this.edad,
      required this.corr,
      required this.imagen,
    });

    String id;
    int registerId;
    String nombApellido;
    String pass;
    String edad;
    String corr;
    String imagen;

    factory Register.fromJson(String str) => Register.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Register.fromMap(Map<String, dynamic> json) => Register(
        id: json["_id"],
        registerId: json["registerId"],
        nombApellido: json["nombApellido"],
        pass: json["pass"],
        edad: json["edad"],
        corr: json["corr"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "registerId": registerId,
        "nombApellido": nombApellido,
        "pass": pass,
        "edad": edad,
        "corr": corr,
        "imagen":imagen,
    };
}
