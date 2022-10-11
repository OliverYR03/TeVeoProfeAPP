import 'dart:convert';

import '../models/justificacion_report.dart';

class JustificacionReportResponse {
  JustificacionReportResponse({
    required this.justificacionReport,
  });

  List<JustificacionReport> justificacionReport;

  factory JustificacionReportResponse.fromJson(String str) =>
      JustificacionReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JustificacionReportResponse.fromMap(Map<String, dynamic> json) =>
      JustificacionReportResponse(
        justificacionReport: List<JustificacionReport>.from(
            json["justificacionReport"]
                .map((x) => JustificacionReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "asistenciaReport":
            List<dynamic>.from(justificacionReport.map((x) => x.toMap())),
      };
}
