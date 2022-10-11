import 'dart:convert';
import 'register.dart';

class RegisterResponse {
    RegisterResponse({
       required this.register,
    });

    List<Register> register;

    factory RegisterResponse.fromJson(String str) => RegisterResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterResponse.fromMap(Map<String, dynamic> json) => RegisterResponse(
        register: List<Register>.from(json["register"].map((x) => Register.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "register": List<dynamic>.from(register.map((x) => x.toMap())),
    };
}