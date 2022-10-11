import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/register_report.dart';
import '../provider/register_provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteRegisterScreen extends StatefulWidget {
  ReporteRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ReporteRegisterScreen> createState() => _ReporteRegisterScreen();
}

class _ReporteRegisterScreen extends State<ReporteRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    final List<RegisterReport> listaRegisterReport =
        registerProvider.listaRegisterReport;

    List<charts.Series<RegisterReport, String>> serie = [
      charts.Series(
        id: 'ReporteRegister',
        data: listaRegisterReport,
        domainFn: (RegisterReport serie, _) => serie.id,
        measureFn: (RegisterReport serie, _) => serie.count,
        colorFn: (RegisterReport serie, _) =>
            charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 180, 216)),
      )
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Reporte'),
        ),
        body: Center(
          child: Container(
              height: 400,
              padding: EdgeInsets.all(20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: <Widget>[
                    Text('REPORTE DE REGISTROS'),
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
