import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/justificacion.dart';
import '../provider/justificacion_provider.dart';

class JustificacionFormScreen extends StatefulWidget {
  const JustificacionFormScreen({Key? key}) : super(key: key);
  @override
  State<JustificacionFormScreen> createState() => _JustificacionFormScreen();
}

enum Categorias { j31, j32 }

class _JustificacionFormScreen extends State<JustificacionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtjustId = TextEditingController();
  final txtMotivo = TextEditingController();
  final txtDetalle = TextEditingController();
  final txtImagen = TextEditingController();
  final txtFecha = TextEditingController();

  Categorias? _catSelection = Categorias.j31;
  bool? _estadoActivo = false;
  bool formModificado = false;

  @override
  Widget build(BuildContext context) {
    final justificacionProvider = Provider.of<JustificacionProvider>(context);

//recibiendo el producto por argumento
    final Justificacion? justificacion =
        ModalRoute.of(context)!.settings.arguments as Justificacion?;

    if (!formModificado) {
      if (justificacion != null) {
        //EDITAR

        txtjustId.text = justificacion.justId.toString();
        txtFecha.text = justificacion.fecha;
        txtDetalle.text = justificacion.detalle;
        txtMotivo.text = justificacion.motivo;
        txtImagen.text = justificacion.imagen;

        print(justificacion.categoria);
        print(justificacion.detalle);

        if (justificacion.categoria == 'Categorias.j31') {
          _catSelection = Categorias.j31;
        } else {
          _catSelection = Categorias.j32;
        }
        _estadoActivo = (justificacion.detalle == 'true') ? true : false;
      } else {
        txtjustId.text = '0';
        txtDetalle.text = '';
        txtMotivo.text = '';
        txtFecha.text = '';
        txtImagen.text = '';
      }
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 172, 206, 222),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "JUSTIFICAR ABANDONO!",
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              readOnly: true,
              controller: txtjustId,
              decoration: InputDecoration(
                  labelText: 'JustificacionId',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration: InputDecoration(
                    labelText: "Motivo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtMotivo,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "INGRESE MOTIVO";
                  }
                },
                maxLength: 10),
            TextFormField(
              maxLength: 20,
              decoration: InputDecoration(
                  labelText: "Detalle",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtDetalle,
              validator: (value) {
                if (value!.isEmpty) {
                  return "INGRESE DETALLE";
                }
              },
            ),
            SizedBox(
              height: 3,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Imagen',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtImagen,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una imagen';
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Fecha',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtFecha,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una fecha';
                }
              },
            ),
            Row(
              children: <Widget>[
                Text("Aula"),
                SizedBox(
                  width: 20,
                ),
                Radio(
                    value: Categorias.j31,
                    groupValue: _catSelection,
                    onChanged: (value) {
                      setState(() {
                        _catSelection = value as Categorias?;
                        print(_catSelection);
                      });
                    }),
                Text("J31"),
                SizedBox(
                  height: 20,
                ),
                Radio(
                    value: Categorias.j32,
                    groupValue: _catSelection,
                    onChanged: (value) {
                      setState(() {
                        _catSelection = value as Categorias?;
                        print(_catSelection);
                        formModificado = true;
                      });
                    }),
                Text('j312'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text("Justificado"),
                SizedBox(
                  width: 20,
                ),
                Checkbox(
                    value: _estadoActivo,
                    onChanged: (value) {
                      setState(() {
                        _estadoActivo = value;
                        print("_estadoActivo:${_estadoActivo}");
                      });
                    }),
                Text("En curso")
              ],
            ),
            Container(
              child: ElevatedButton(
                child: const Text('GUARDAR'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Guardando...')));

                    var justificacion = Justificacion(
                      id: '',
                      justId: int.parse(txtjustId.text),
                      motivo: txtMotivo.text,
                      detalle: txtDetalle.text,
                      imagen: txtImagen.text,
                      categoria: _catSelection.toString(),
                      estado: _estadoActivo.toString(),
                      fecha: txtFecha.text,
                    );

                    justificacionProvider.saveJustificacion(justificacion);

                    Navigator.pushReplacementNamed(
                        context, 'ruta_justificacion');
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
