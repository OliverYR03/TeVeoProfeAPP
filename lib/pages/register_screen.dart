import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/register.dart';
import '../models/register_response.dart';
import '../provider/register_provider.dart';

class RegisterScreen extends StatefulWidget {
  //lo que hacemos es crear una clase de productosform y le hacemos una extension de StatefulWidget
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

    final txtnombApellido = TextEditingController();
    final txtpass = TextEditingController();
    final txtcorr = TextEditingController();
    final txtedad = TextEditingController();
    final txtimagen = TextEditingController();
    bool formModificado = false;
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    //Aqui tenemos que hacer los argumentos
    final Register? register =
        ModalRoute.of(context)!.settings.arguments as Register?;
    if (!formModificado) {
      if (register != null) {
        // EDITAR
        txtnombApellido.text = register.nombApellido;
        txtpass.text = register.pass;
        txtcorr.text = register.corr;
        txtedad.text = register.edad;
        txtimagen.text = register.imagen;
    }else {
        // NUEVO
        txtnombApellido.text = '';
        txtpass.text = '';
        txtcorr.text = '';
        txtedad.text = '';
        txtimagen.text = '';
      }
    }
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 172, 206, 222),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('REGISTRATE AQUI'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(70.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              maxLines:
                  1, //Este de aqui sirve para colocar la cantidad de lineas que se va a utilizar
              maxLength:
                  20, //Este de aqui es para colocar el maximo de caracteres que podemos usar
              decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtnombApellido,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese su nuevo  usuario por favor';
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtpass,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese por favor la nueva contraseña ';
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Edad',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtedad,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese su edad ';
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Correo Electronico',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtcorr,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese su correo electronico ';
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Imagen',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtimagen,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese su foto de perfil por favor';
                }
              },
            ),
            Container(
              child: MaterialButton(
                height: 40,
                minWidth: 200.0,
                color: Colors.lightBlue,
                child: const Text('REGISTRATE',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Creandoo...')));

                    var register = Register(
                        id: '',
                        registerId: 0,
                        nombApellido: txtnombApellido.text,
                        edad: txtedad.text,
                        corr: txtcorr.text,
                        pass: txtpass.text,
                        imagen: txtimagen.text);
                    registerProvider.saveRegister(register);

                    Navigator.pushReplacementNamed(context, 'ruta_form_register');
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}