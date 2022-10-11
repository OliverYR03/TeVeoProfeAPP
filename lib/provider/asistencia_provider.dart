import 'dart:io';

import 'package:flutter/material.dart';
import '../models/asistencia.dart';
import 'package:http/http.dart' as http;
import '../models/asistencia_report.dart';
import '../models/asistencia_report_response.dart';
import '../models/asistencia_response.dart';

class AsistenciaProvider extends ChangeNotifier {
  String _baseUrl = '192.168.0.3:3999';

  List<Asistencia> listaAsistencia = [];
  List<AsistenciaReport> listaAsistenciaReport = [];

  AsistenciaProvider() {
    print('Ingresando a AsistenciaProvider');
    this.getOnAsistenciaList();
    this.reporteAsistencia();
  }
  getOnAsistenciaList() async {
    var url = Uri.http(_baseUrl, '/api/asistencia', {});
    final response = await http.get(url);
    print(response.body);
    final asistenciaResponse = AsistenciaResponse.fromJson(response.body);
    listaAsistencia = asistenciaResponse.asistencia;
    notifyListeners();
  }

  saveAsistencia(Asistencia asistencia) async {
    var url = Uri.http(_baseUrl, '/api/asistencia/save');
    print(asistencia.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: asistencia.toJson());
    print(response.body);
    getOnAsistenciaList();
    reporteAsistencia();
    notifyListeners();
  }

  reporteAsistencia() async {
    var url = Uri.http(_baseUrl, '/api/reportes/asistenciaReport');
    final response = await http.get(url);
    final asistenciaReportResponse =
        AsistenciaReportResponse.fromJson(response.body);
    listaAsistenciaReport = asistenciaReportResponse.asistenciaReport;
    notifyListeners();
  }
}
