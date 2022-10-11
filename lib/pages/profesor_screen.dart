import 'package:flutter/material.dart';
import '../search/profesor_search.dart';
import '../widgets/menu_lateral.dart';
import 'package:provider/provider.dart';

import '../models/profesor.dart';
import '../provider/profesor_provider.dart';

class ProfesorScreen extends StatefulWidget {
  @override
  createState() => _ProfesorScreen();
}

class _ProfesorScreen extends State<ProfesorScreen> {
  get kActiveColor => null;

  @override
  Widget build(BuildContext context) {
    final profesorProvider = Provider.of<ProfesorProvider>(context);
    final List<Profesor> listaProfesor = profesorProvider.listaProfesor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Column(
            children: [
              Text(
                "LISTADO".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.black),
              ),
              Text(
                "DE PROFESORES",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProfesorSearchDelegate(listaProfesor),
              );
            },
          ),
        ],
      ),
      drawer: const MenuLateral(),
      body: Center(
          child: ListView.builder(
        itemCount: listaProfesor.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: (Container(
              margin: EdgeInsets.only(top: 30, bottom: 50),
              width: double.infinity,
              height: 400,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  // _ImagenFondo(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      child: FadeInImage(
                        placeholder: AssetImage('assets/carretera.gif'),
                        image: NetworkImage(listaProfesor[index].imagen),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                      color: Colors.amberAccent,
                      child: ListTile(
                        title: Text(
                          listaProfesor[index].nombApellido,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        subtitle: Text(
                          listaProfesor[index].curso,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'ruta_form_profesor',
                                arguments: listaProfesor[index]);
                          },
                        ),
                      ))
                ],
              ),
            )),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'ruta_form_profesor');
        },
      ),
    );
  }
}
