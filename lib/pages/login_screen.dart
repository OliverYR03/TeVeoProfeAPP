import 'package:flutter/material.dart'; //Importamos el package de flutter aqui

class LoginScreen extends StatefulWidget {
  //Mencionamos a la clase LoginScreen con una extencion de StatefulWidget
  @override
  createState() => _LoginScreen(); //Creamos la clase privada
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey =
      GlobalKey<FormState>(); //Creamos una variable para validar el formulario
  @override
  Widget build(BuildContext context) {
    final txtnombApellido =
        TextEditingController(); //Aqui estamos creando una variable llamada usuario
    final txtpass =
        TextEditingController(); //Aqui estamos creando una variable llamada contraseña o password
    return Scaffold(
      //Este de aqui es el esqueleto de la aplicacion
      backgroundColor: Color.fromARGB(255, 172, 206, 222),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('TE VEO PROFE!'),
        centerTitle:
            true, //Aqui le estamos colocando un titulo que aparecera en nuestra aplicacion
      ),
      body: Container(
        //El container en este caso es el fondo
        padding: const EdgeInsets.all(
            70.0), //Este de aqui sirve para separar del borde en este caso
        child: Form(
          //Aqui estamos creamos una clase llamada formulario
          key: _formKey,
          child: Column(
            //Aqui creamos una clase llamada columna
            children: [
              TextFormField(
                //Este de aqui es donde el docente ingresara su correo electronico en este caso
                autocorrect:
                    false, //Este de aqui sirve para que no se autocorriga
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    //Aqui vamos a empezar a decorar el InputDecoration
                    hintText: '',
                    labelText:
                        'Usuario', //Esto es necesario para saber que tiene que colocar el usuario en este caso
                    border: OutlineInputBorder(
                        //Aqui vamos a darle un border a el input
                        borderRadius: BorderRadius.circular(
                            20.0) //Le colocamos como podemos ver un border circular
                        ),
                    suffixIcon: Icon(Icons
                        .person) //Aqui le colocamos un icono de persona a nuestro input
                    ),
                controller:
                    txtnombApellido, //Todo lo que coloca lo guardara en la variable txtUser
                validator: (value) {
                  //Este de aqui se encarga de validar lo que  coloca
                  if (value!.isEmpty) {
                    //En caso de que este vacio se imprimira el siguente mensaje en este caso
                    return 'Por favor ingrese su usuario';
                  }
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                //Este de aqui es donde podria ingresar la contraseña en este caso
                autocorrect:
                    false, //Este de aqui sirve para que no se autocorriga
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    //Aqui sirve para empezar a decorar el Input
                    hintText: '***',
                    labelText:
                        'Contraseña', //Aqui le pedimos al usuario que coloque la contraseña
                    border: OutlineInputBorder(
                        //Aqui vamos a darle un border al input
                        borderRadius: BorderRadius.circular(
                            20.0) //Le colocamos un borde circular
                        ),
                    suffixIcon: Icon(Icons
                        .lock_outline) //Aqui le colocamos un icono de un candado  en este caso
                    ),
                controller:
                    txtpass, //Todo lo que coloca lo guardara en la variable txtPass
                obscureText: true,

                validator: (value) {
                  //Este de aqui se enarga de validar lo que coloca
                  if (value!.isEmpty) {
                    //En caso de que este vacio se imprimira el siguente mensaje en este caso
                    return 'Por favor ingrese su contraseña';
                  }
                },
              ),
              SizedBox(height: 30.0),
              Container(
                child: ElevatedButton(
                  child: const Text('INGRESAR'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Validando....'), //Si es valido aparecera que esta validandoo......
                        backgroundColor: Colors
                            .blueAccent, //Aqui como podemos ver estamos colocando un color al fondo
                      ));
                      //Validamos si el usuario y contraseña son correctos
                      if (txtnombApellido.text == 'Messi' &&
                          txtpass.text == 'mess') {
                        Navigator.pushReplacementNamed(
                            context, 'ruta_profesor');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Credencias incorrectas'),
                            backgroundColor: Colors.blueAccent,
                          ),
                        );
                      }
                    }
                  },
                ),
              )
            ],
          ), //Este de aqui sirve para colocarlo como si fuera una torre
        ), //Este de aqui lo vamos a hacer para que este un poco en el centro
      ),
      floatingActionButton: FloatingActionButton(
        //Aqui como podemos ver aqui creamos un boton flotante
        child: const Icon(
            Icons.add), //Colocamos el simnbolo de añadir en este caso
        onPressed: () {
          Navigator.pushNamed(context,
              'ruta_register_form'); //Lo redirigimos a la carpeta ruta_productos_form
        },
        backgroundColor: Colors.green,
      ),
    );
  }
}
