import 'package:flutter/material.dart';
import 'package:flutter_application_te_veo_profe/models/profesor_report.dart';
import 'package:flutter_application_te_veo_profe/provider/profesor_provider.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../provider/profesor_provider.dart';

class ReporteProfesorScreen extends StatefulWidget {
  ReporteProfesorScreen({Key? key}) : super(key: key);

  @override
  State<ReporteProfesorScreen> createState() => _ReporteProfesorScreen();
}

class _ReporteProfesorScreen extends State<ReporteProfesorScreen> {
  @override
  Widget build(BuildContext context) {
    final profesorProvider = Provider.of<ProfesorProvider>(context);
    final List<ProfesorReport> listaProfesorReport =
        profesorProvider.listaProfesorReport;

    List<charts.Series<ProfesorReport, String>> serie = [
      charts.Series(
          id: 'ReporteProfesor',
          data: listaProfesorReport,
          domainFn: (ProfesorReport serie, _) => serie.id,
          measureFn: (ProfesorReport serie, _) => serie.count,
          colorFn: (ProfesorReport serie, _) =>
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 180, 216)))
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('Reporte'),
        ),
        body: Center(
          child: Container(
              height: 400,
              padding: EdgeInsets.all(20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: <Widget>[
                    Text('REPORTE DE PROFESORES'),
                    Expanded(
                        child: charts.BarChart(
                      serie,
                      animate: true,
                    )),
                    Text('FUENTE: MONGODB')
                  ]),
                ),
              )),
        ));
  }
}
