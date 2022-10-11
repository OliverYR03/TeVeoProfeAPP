import 'package:flutter/material.dart';
import '../provider/justificacion_provider.dart';
import 'package:provider/provider.dart';
import '../models/justificacion_report.dart';
import '../widgets/menu_lateral.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportJustificacionScreen extends StatefulWidget {
  ReportJustificacionScreen({Key? key}) : super(key: key);

  @override
  State<ReportJustificacionScreen> createState() =>
      _ReportJustificacionScreenState();
}

class _ReportJustificacionScreenState extends State<ReportJustificacionScreen> {
  @override
  Widget build(BuildContext context) {
    final justificacionProvider = Provider.of<JustificacionProvider>(context);
    final List<JustificacionReport> listaJustificacionReport =
        justificacionProvider.listaJustificacionReport;

    List<charts.Series<JustificacionReport, String>> serie = [
      charts.Series(
          id: 'ReporteJustificacion',
          data: listaJustificacionReport,
          domainFn: (JustificacionReport serie, _) => serie.id,
          measureFn: (JustificacionReport serie, _) => serie.count,
          colorFn: (JustificacionReport serie, _) =>
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 180, 216)))
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Reportes')),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text('REPORTE DE JUSTIFICACION DE JUSTIFICACIONES'),
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
