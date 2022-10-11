import 'dart:convert';

class AsistenciaReport {
    AsistenciaReport({
        required this.id,
        required this.count,
    });

    String id;
    int count;

    factory AsistenciaReport.fromJson(String str) => AsistenciaReport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AsistenciaReport.fromMap(Map<String, dynamic> json) => AsistenciaReport(
        id: json["_id"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
    };
}
