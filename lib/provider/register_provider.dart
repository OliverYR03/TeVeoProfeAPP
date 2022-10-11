import 'dart:io';
import 'package:flutter/material.dart';
import '../models/register_report.dart';
import '../models/register_report_response.dart';
import '../models/register_response.dart';
import 'package:http/http.dart' as http;
import '../models/register.dart';

class RegisterProvider extends ChangeNotifier {
  String _baseUrl = '192.168.0.3:3999';

  List<Register> listaRegister = [];
  List<RegisterReport> listaRegisterReport = [];
  RegisterProvider() {
    print('Ingresando a RegiterProvider');
    this.getOnRegisterList();
    this.reportRegister();
  }

  getOnRegisterList() async {
    var url = Uri.http(_baseUrl, 'api/register', {});
    final response = await http.get(url);
    print(response.body);
    final registerResponse = RegisterResponse.fromJson(response.body);
    listaRegister = registerResponse.register;
    notifyListeners();
  }

  saveRegister(Register register) async {
    var url = Uri.http(_baseUrl, 'api/register/save');
    print(register.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: register.toJson());
    print(response);
    getOnRegisterList();
    notifyListeners();
  }

  reportRegister() async {
    var url = Uri.http(_baseUrl, 'api/reporte/registerReport');
    final response = await http.get(url);
    final registerReportResponse =
        RegisterReportResponse.fromJson(response.body);
    listaRegisterReport = registerReportResponse.registerReport;
    notifyListeners();
  }
}
