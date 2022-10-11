import 'package:flutter/material.dart';
import '../models/justificacion.dart';

class JustificacionSearchDelegate extends SearchDelegate<Justificacion> {
  final List<Justificacion> listaJustificacion;
  JustificacionSearchDelegate(this.listaJustificacion);

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: donde aparace el icono y sirve para limpiar
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
    // TODO:
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.blueAccent,
      ),
      onPressed: () {
        close(
            context,
            Justificacion(
              id: '',
              justId: 0,
              motivo: '',
              detalle: '',
              imagen: '',
              categoria: '',
              estado: '',
              fecha: '',
            ));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaJustificacion
        : listaJustificacion
            .where((justificacion) => justificacion.detalle
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

    // TODO:implememntacion de filtro
    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardJustificacion(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardJustificacion(Justificacion justificacionFiltrado, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(justificacionFiltrado.imagen),
          ),
          title: Text(justificacionFiltrado.motivo),
          subtitle: Text(justificacionFiltrado.detalle),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, 'ruta_justificacion_form',
                arguments: justificacionFiltrado);
          },
        )
      ],
    ),
  );
}
