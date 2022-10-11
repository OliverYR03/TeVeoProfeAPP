import 'package:flutter/material.dart';

import '../models/profesor.dart';

class ProfesorSearchDelegate extends SearchDelegate<Profesor> {
  final List<Profesor> listaProfesor;

  ProfesorSearchDelegate(this.listaProfesor);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(
            context,
            Profesor(
                id: '',
                profesorId: 0,
                aula: '',
                curso: '',
                imagen: '',
                nombApellido: '',
                dni: ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaProfesor
        : listaProfesor
            .where((profesor) => profesor.nombApellido
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardProfesor(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardProfesor(Profesor profesorFiltrado, context) {
  return Card(
    child: Column(children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(profesorFiltrado.imagen),
        ),
        title: Text(profesorFiltrado.nombApellido),
        subtitle: Text(profesorFiltrado.aula),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, 'ruta_form_profesor',
              arguments: profesorFiltrado);
        },
      )
    ]),
  );
}
