import 'package:flutter/material.dart';
import '../models/asistencia.dart';

class AsistenciaSearchDelegate extends SearchDelegate<Asistencia> {
  final List<Asistencia> listaAsistencia;

  AsistenciaSearchDelegate(this.listaAsistencia);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.blueAccent,
        ),
        onPressed: () {
          close(
              context,
              Asistencia(
                  id: '',
                  asistenciaId: 0,
                  nombcurso: '',
                  seccioncurso: '',
                  hora: '',
                  imagen: '',
                  categoria: ''));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaAsistencia
        : listaAsistencia
            .where((asistencia) => asistencia.nombcurso
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaFiltrada.length, //listaFiltrada.length
      itemBuilder: (BuildContext context, int index) {
        return _cardAsistencia(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardAsistencia(Asistencia asistenciaFiltrado, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(asistenciaFiltrado.imagen),
          ),
          title: Text(asistenciaFiltrado.nombcurso),
          subtitle: Text(asistenciaFiltrado.seccioncurso),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, 'ruta_asistencia_form',
                arguments: asistenciaFiltrado);
          },
        )
      ],
    ),
  );
}
