import 'package:flutter/material.dart';
import '../models/register.dart';

class RegisterSearchDelegate extends SearchDelegate<Register> {
  final List<Register> listaRegister;

  RegisterSearchDelegate(this.listaRegister);

  @override
  List<Widget>? buildActions(BuildContext context) {
    //Este de aqui es la parte de cerrar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //Este de aqui es el boton flecha
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(
            context,
            Register(
                id: '',
                registerId: 0,
                nombApellido: '',
                edad: '',
                corr: '',
                pass: '',
                imagen: ''));
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
        ? listaRegister
        : listaRegister.where((register) =>
            register.nombApellido.toLowerCase().contains(query.toLowerCase()));
    return ListView.builder(
      itemCount: listaRegister.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardRegister(listaRegister[index], context);
      },
    );
  }
}

Widget _cardRegister(Register registerFiltrado, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(registerFiltrado.imagen),
          ),
          title: Text(registerFiltrado.nombApellido),
          subtitle: Text(registerFiltrado.corr),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, 'ruta_productos_form',
                arguments: registerFiltrado);
          },
        )
      ],
    ),
  );
}
