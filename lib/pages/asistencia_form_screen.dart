import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/asistencia.dart';
import '../provider/asistencia_provider.dart';

class AsistenciaFormScreen extends StatefulWidget {
  const AsistenciaFormScreen({Key? key}) : super(key: key);
  @override
  State<AsistenciaFormScreen> createState() => _AsistenciaFormScreen();
}

enum Categorias { asistio, falta }

class _AsistenciaFormScreen extends State<AsistenciaFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final txtAsistenciaId = TextEditingController();
  final txtNombcurso = TextEditingController();
  final txtSeccion = TextEditingController();
  final txtHora = TextEditingController();
  final txtImagen = TextEditingController();

  Categorias? _catSeleccion = Categorias.asistio;
  bool formModificado = false;
  @override
  Widget build(BuildContext context) {
    final asistenciaProvider = Provider.of<AsistenciaProvider>(context);
    // RECIBIENDO EL PRODUCTO POR ARGUMENTO
    final Asistencia? asistencia =
        ModalRoute.of(context)!.settings.arguments as Asistencia?;
    if (!formModificado) {
      if (asistencia != null) {
        //EDITAR
        txtAsistenciaId.text = asistencia.asistenciaId.toString();
        txtNombcurso.text = asistencia.nombcurso;
        txtSeccion.text = asistencia.seccioncurso;
        txtHora.text = asistencia.hora;
        txtImagen.text = asistencia.imagen;
        print(asistencia.categoria);
        if (asistencia.categoria == 'Categorias.asistio') {
          _catSeleccion = Categorias.asistio;
        } else {
          _catSeleccion = Categorias.falta;
        }
      } else {
        //NUEVO
        txtAsistenciaId.text = '0';
        txtNombcurso.text = '';
        txtHora.text = '';
        txtImagen.text = '';
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de asistencia'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  readOnly: true,
                  controller: txtAsistenciaId,
                  decoration: InputDecoration(
                    labelText: 'ProductoId',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre del curso',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  controller: txtNombcurso,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese nombre del curso';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Seccion del curso',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  controller: txtSeccion,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una sección';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Hora del curso',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  controller: txtHora,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una hora';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Imagen',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  controller: txtImagen,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una hora';
                    }
                  },
                ),
                Row(
                  children: <Widget>[
                    Text('Asistencia'),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                        value: Categorias.asistio,
                        groupValue: _catSeleccion,
                        onChanged: (value) {
                          setState(() {
                            _catSeleccion = value as Categorias?;
                            print(_catSeleccion);
                            formModificado = true;
                          });
                        }),
                    Text('Asistio'),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                        value: Categorias.falta,
                        groupValue: _catSeleccion,
                        onChanged: (value) {
                          setState(() {
                            _catSeleccion = value as Categorias?;
                            print(_catSeleccion);
                            formModificado = true;
                          });
                        }),
                    Text('Falta'),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: ElevatedButton(
                    child: const Text('GUARDAR'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Validando...')));
                        var asistencia = Asistencia(
                            id: '',
                            asistenciaId: int.parse(txtAsistenciaId.text),
                            nombcurso: txtNombcurso.text,
                            seccioncurso: txtSeccion.text,
                            hora: txtHora.text,
                            imagen: txtImagen.text,
                            categoria: _catSeleccion.toString());

                        asistenciaProvider.saveAsistencia(asistencia);

                        Navigator.pushReplacementNamed(
                            context, 'ruta_asistencia');
                      }
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
