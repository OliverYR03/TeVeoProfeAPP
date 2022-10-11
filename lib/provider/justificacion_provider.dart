import 'dart:io';
import 'package:flutter/material.dart';
import '../models/justificacion.dart';
import '../models/justificacion_report.dart';
import '../models/justificacion_response.dart';
import '../models/justificacion_report_response.dart';
import 'package:http/http.dart' as http;

class JustificacionProvider extends ChangeNotifier {
  String _baseUrl = '192.168.0.3:3999';

  List<Justificacion> listaJustificacion = [];
  List<JustificacionReport> listaJustificacionReport = [];
  JustificacionProvider() {
    print("Ingresando a JustificacionProvider");
    this.getOnJustificacionList();
    this.reporteJustificacion();
  }

  getOnJustificacionList() async {
    var url = Uri.http(_baseUrl, '/api/justificacion', {});
    final response = await http.get(url);
    print(response.body);
    final justificacionResponse = JustificacionResponse.fromJson(response.body);
    listaJustificacion = justificacionResponse.justificacion;
    notifyListeners();
    print("Ingresando a justificacion list");
  }

  saveJustificacion(Justificacion justificacion) async {
    var url = Uri.http(_baseUrl, '/api/justificacion/save');
    print(justificacion.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: justificacion.toJson());
    print(response.body);
    getOnJustificacionList();
    notifyListeners();
  }

  reporteJustificacion() async {
    var url = Uri.http(_baseUrl, '/api/reporte/justificacionReport');
    final response = await http.get(url);
    final justificacionReportResponse =
        JustificacionReportResponse.fromJson(response.body);
    listaJustificacionReport = justificacionReportResponse.justificacionReport;
    notifyListeners();
  }
}
