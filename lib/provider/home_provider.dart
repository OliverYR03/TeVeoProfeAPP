import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import '../models/home.dart';
import '../models/home_response.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  String _baseUrl = '192.168.0.3:3999';

  List<Home> listaHome = [];
  HomeProvider() {
    print('Ingresando a HomeProvider');
    this.getOnProductoList();
  }

  getOnProductoList() async {
    var url = Uri.http(_baseUrl, '/api/home', {});
    final response = await http.get(url);
    print(response.body);
    final homeResponse = HomeResponse.fromJson(response.body);
    listaHome = homeResponse.home;
    notifyListeners();
  }

  saveHome(Home home) async {
    var url = Uri.http(_baseUrl, '/api/home/save');
    print(home.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: home.toJson());
    print(response.body);
    getOnProductoList();
    notifyListeners();
  }
}
