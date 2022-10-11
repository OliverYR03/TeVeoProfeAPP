import 'package:flutter/material.dart';
import 'package:flutter_application_te_veo_profe/pages/asistencia_form_screen.dart';
import 'package:flutter_application_te_veo_profe/pages/asistencia_screen.dart';
import 'package:flutter_application_te_veo_profe/pages/home_screen.dart';
import 'package:flutter_application_te_veo_profe/pages/justificacion_form_screen.dart';
import 'package:flutter_application_te_veo_profe/pages/justificacion_screen.dart';
import 'package:flutter_application_te_veo_profe/pages/login_screen.dart';
import 'package:flutter_application_te_veo_profe/pages/principal_screen.dart';
import 'package:flutter_application_te_veo_profe/pages/profesor_form_screen.dart';

import 'package:flutter_application_te_veo_profe/pages/profesor_screen.dart';
import 'package:flutter_application_te_veo_profe/pages/register_screen.dart';
import 'package:flutter_application_te_veo_profe/provider/justificacion_provider.dart';
import 'package:flutter_application_te_veo_profe/provider/profesor_provider.dart';
import 'package:flutter_application_te_veo_profe/provider/register_provider.dart';
import 'package:provider/provider.dart';

import 'pages/advertencia_screen.dart';
import 'pages/register_form_screen.dart';
import 'pages/reporte_justificacion_screen.dart';
import 'pages/reporte_register_screen.dart';
import 'pages/repore_screen_profesor.dart';
import 'pages/reporte_asistencia_sreen.dart';
import 'provider/asistencia_provider.dart';
import 'provider/home_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfesorProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (_) => HomeProvider(), lazy: false), // OLIVER
        ChangeNotifierProvider(
            create: (_) => JustificacionProvider(), lazy: false), //ALEXANDER
        ChangeNotifierProvider(
            create: (_) => RegisterProvider(), lazy: false), //YAIR
        ChangeNotifierProvider(
            create: (_) => AsistenciaProvider(), lazy: false), //NICOLE
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TE VEO PROFE',
        initialRoute: 'ruta_login',
        routes: {
          //YAIR
          'ruta_home': (_) => HomeScreen(),
          'ruta_login': (_) => LoginScreen(),
          'ruta_register_form': (_) => RegisterScreen(),
          'ruta_register': (_) => RegisterFormScreen(),
          'ruta_reporte_register': (_) => ReporteRegisterScreen(),
          //OLIVER
          'ruta_home': (_) => HomeScreen(),
          'ruta_profesor': (_) => ProfesorScreen(),
          'ruta_form_profesor': (_) => ProfesorFormScreen(),
          'ruta_reporte_profesor': (_) => ReporteProfesorScreen(),
          //ALEXANDER
          'ruta_justificacion_form': (_) => JustificacionFormScreen(),
          'ruta_justificacion': (_) => JustificacionScreen(),
          'ruta_reporte_justificacion': (_) => ReportJustificacionScreen(),
          //NICOLE
          'ruta_asistencia': (_) => AsistenciaScreen(),
          'ruta_asistencia_form': (_) => AsistenciaFormScreen(),
          'ruta_reporte_asistencia': (_) => ReportAsistenciaScreen(),
        },
      ),
    );
  }
}
