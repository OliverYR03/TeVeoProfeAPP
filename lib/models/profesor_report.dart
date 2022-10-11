import 'dart:convert';

class ProfesorReport {
  ProfesorReport({
    required this.id,
    required this.count,
  });

  String id;
  int count;

  factory ProfesorReport.fromJson(String str) =>
      ProfesorReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfesorReport.fromMap(Map<String, dynamic> json) => ProfesorReport(
        id: json["_id"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
      };
}
