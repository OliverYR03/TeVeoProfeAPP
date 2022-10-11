import 'dart:convert';

class JustificacionReport {
  JustificacionReport({
    required this.id,
    required this.count,
  });

  String id;
  int count;

  factory JustificacionReport.fromJson(String str) =>
      JustificacionReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JustificacionReport.fromMap(Map<String, dynamic> json) =>
      JustificacionReport(
        id: json["_id"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
      };
}
