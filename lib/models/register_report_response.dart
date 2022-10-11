import 'dart:convert';

import '../models/register_report.dart';

class RegisterReportResponse {
  RegisterReportResponse({
    required this.registerReport,
  });

  List<RegisterReport> registerReport;

  factory RegisterReportResponse.fromJson(String str) =>
      RegisterReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterReportResponse.fromMap(Map<String, dynamic> json) =>
      RegisterReportResponse(
        registerReport: List<RegisterReport>.from(
            json["registerReport"].map((x) => RegisterReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "registerReport":
            List<dynamic>.from(registerReport.map((x) => x.toMap())),
      };
}
