import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/profesor.dart';
import '../provider/profesor_provider.dart';

class ProfesorFormScreen extends StatefulWidget {
  const ProfesorFormScreen({Key? key}) : super(key: key);
  @override
  State<ProfesorFormScreen> createState() => _ProfesorFormScreen();
}

enum Aula { J61, J62, J63 }

class _ProfesorFormScreen extends State<ProfesorFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final txtProfesorId = TextEditingController();
  final txtcurso = TextEditingController();
  final txtnombApellido = TextEditingController();
  final txtimage = TextEditingController();
  final txtdni = TextEditingController();

  Aula? _catAula = Aula.J61;
  bool formModificado = false;
  @override
  Widget build(BuildContext context) {
    final profesorProvider = Provider.of<ProfesorProvider>(context);
    // RECIBIENDO EL PROFE POR ARGUMENTO
    final Profesor? profesor =
        ModalRoute.of(context)!.settings.arguments as Profesor?;
    if (!formModificado) {
      if (profesor != null) {
        //EDITAR
        txtProfesorId.text = profesor.profesorId.toString();
        txtcurso.text = profesor.curso;
        txtnombApellido.text = profesor.nombApellido;
        txtimage.text = profesor.imagen;
        txtdni.text = profesor.dni;
        print(profesor.aula);
        if (profesor.aula == 'J61') {
          _catAula = Aula.J61;
        } else {
          _catAula = Aula.J62;
        }
      } else {
        txtProfesorId.text = '0';
        txtcurso.text = '';
        txtnombApellido.text = '';
        txtdni.text = '';
        txtimage.text = '';
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTRO DE PROFESOR'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    labelText: 'ID',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtProfesorId,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nombres',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtnombApellido,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una descripción';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'DNI',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  controller: txtdni,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un curso';
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Curso',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  controller: txtcurso,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un curso';
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Imagen',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  controller: txtimage,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un curso';
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text('Aula'),
                  SizedBox(
                    width: 20,
                  ),
                  Radio(
                      value: Aula.J61,
                      groupValue: _catAula,
                      onChanged: (value) {
                        setState(() {
                          _catAula = value as Aula?;
                          print(_catAula);
                          formModificado = true;
                        });
                      }),
                  Text(' J61'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Aula.J62,
                      groupValue: _catAula,
                      onChanged: (value) {
                        setState(() {
                          _catAula = value as Aula?;
                          print(_catAula);
                          formModificado = true;
                        });
                      }),
                  Text('J62'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Aula.J63,
                      groupValue: _catAula,
                      onChanged: (value) {
                        setState(() {
                          _catAula = value as Aula?;
                          print(_catAula);
                          formModificado = true;
                        });
                      }),
                  Text('J63'),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              Container(
                child: ElevatedButton(
                  child: const Text('GUARDAR'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Guardando....')));

                      var profesor = Profesor(
                        id: '',
                        profesorId: int.parse(txtProfesorId.text),
                        nombApellido: txtnombApellido.text,
                        curso: txtcurso.text,
                        aula: _catAula.toString(),
                        imagen: txtimage.text,
                        dni: txtdni.text,
                      );

                      profesorProvider.saveProfesor(profesor);

                      Navigator.pushReplacementNamed(context, 'ruta_profesor');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
