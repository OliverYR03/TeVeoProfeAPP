import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import '../models/profesor.dart';
import '../models/profesor_response.dart';
import '../models/profesor_report.dart';
import '../models/profesor_report_response.dart';
import 'package:http/http.dart' as http;

class ProfesorProvider extends ChangeNotifier {
  String _baseUrl = '192.168.0.3:3999';

  List<Profesor> listaProfesor = [];
  List<ProfesorReport> listaProfesorReport = [];
  ProfesorProvider() {
    print('Ingresando a ProfesorProvider');
    this.getOnProductoList();
    this.reportProfesor();
  }

  getOnProductoList() async {
    var url = Uri.http(_baseUrl, '/api/profesor', {});
    final response = await http.get(url);
    print(response.body);
    final profesorResponse = ProfesorResponse.fromJson(response.body);
    listaProfesor = profesorResponse.profesor;
    notifyListeners();
  }

  saveProfesor(Profesor profesor) async {
    var url = Uri.http(_baseUrl, '/api/profesor/save');
    print(profesor.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: profesor.toJson());
    print(response.body);
    getOnProductoList();
    reportProfesor();
    notifyListeners();
  }

  reportProfesor() async {
    var url = Uri.http(_baseUrl, '/api/reporte/profesorReport');
    final response = await http.get(url);
    final profesorReportResponse =
        ProfesorReportResponse.fromJson(response.body);
    listaProfesorReport = profesorReportResponse.profesorReport;
    notifyListeners();
  }
}
