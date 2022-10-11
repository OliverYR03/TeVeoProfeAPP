import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/asistencia_report.dart';
import '../provider/asistencia_provider.dart';
import '../widgets/menu_lateral.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final asistenciaProvider = Provider.of<AsistenciaProvider>(context);
    final List<AsistenciaReport> listaAsistenciaReport =
        asistenciaProvider.listaAsistenciaReport;

    List<charts.Series<AsistenciaReport, String>> serie = [
      charts.Series(
          id: 'ReporteAsistencia',
          data: listaAsistenciaReport,
          domainFn: (AsistenciaReport serie, _) => serie.id,
          measureFn: (AsistenciaReport serie, _) => serie.count,
          colorFn: (AsistenciaReport serie, _) =>
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 180, 216)))
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Reportes')),
      drawer: MenuLateral(),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text('REPORTE DE ASISTENCIA POR ASISTIO O FALTAS'),
                  Expanded(
                      child: charts.BarChart(
                    serie,
                    animate: true,
                  )),
                  Text('FUENTE: MONGODB')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
