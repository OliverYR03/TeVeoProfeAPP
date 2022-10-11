import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/colegio.jpg'), fit: BoxFit.cover),
              )),
          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_home');
            },
          ),
          ListTile(
            title: const Text('Justificacion'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_justificacion');
            },
          ),
          ListTile(
            title: const Text('Asistencia'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_asistencia');
            },
          ),
          ListTile(
            title: const Text('Profesores'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_profesor');
            },
          ),
          ListTile(
            title: const Text('Reporte Profesor'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reporte_profesor');
            },
          ),
          ListTile(
            title: const Text('Reporte Asistencia'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reporte_asistencia');
            },
          ),
          ListTile(
            title: const Text('Reporte Register'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reporte_register');
            },
          ),
          ListTile(
            title: const Text('Reporte Justificacion'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reporte_justificacion');
            },
          ),
          Divider(),
          ListTile(
            title: const Text('Cerrar Sesión'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_login');
            },
          ),
          ListTile(
            title: const Text('Detalle Register'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_register');
            },
          ),
        ],
      ),
    );
  }
}
