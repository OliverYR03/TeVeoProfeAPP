import 'dart:convert';

class RegisterReport {
  RegisterReport({
    required this.id,
    required this.count,
  });

  String id;
  int count;

  factory RegisterReport.fromJson(String str) =>
      RegisterReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterReport.fromMap(Map<String, dynamic> json) => RegisterReport(
        id: json["_id"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
      };
}
