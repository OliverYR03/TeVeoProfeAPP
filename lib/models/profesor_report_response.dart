import 'dart:convert';

import '../models/profesor_report.dart';

class ProfesorReportResponse {
  ProfesorReportResponse({
    required this.profesorReport,
  });

  List<ProfesorReport> profesorReport;

  factory ProfesorReportResponse.fromJson(String str) =>
      ProfesorReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfesorReportResponse.fromMap(Map<String, dynamic> json) =>
      ProfesorReportResponse(
        profesorReport: List<ProfesorReport>.from(
            json["profesorReport"].map((x) => ProfesorReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "profesorReport":
            List<dynamic>.from(profesorReport.map((x) => x.toMap())),
      };
}
