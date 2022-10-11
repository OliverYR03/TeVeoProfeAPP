import 'dart:convert';

import '../models/asistencia_report.dart';

class AsistenciaReportResponse {
  AsistenciaReportResponse({
    required this.asistenciaReport,
  });

  List<AsistenciaReport> asistenciaReport;

  factory AsistenciaReportResponse.fromJson(String str) =>
      AsistenciaReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AsistenciaReportResponse.fromMap(Map<String, dynamic> json) =>
      AsistenciaReportResponse(
        asistenciaReport: List<AsistenciaReport>.from(
            json["asistenciaReport"].map((x) => AsistenciaReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "asistenciaReport":
            List<dynamic>.from(asistenciaReport.map((x) => x.toMap())),
      };
}
