import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../search/justificacion_search_delegate.dart';
import '../provider/justificacion_provider.dart';
import '../widgets/menu_lateral.dart';
import 'package:provider/provider.dart';

import '../models/justificacion.dart';

class JustificacionScreen extends StatefulWidget {
  @override
  createState() => _JustificacionScreen();
}

class _JustificacionScreen extends State<JustificacionScreen> {
  @override
  Widget build(BuildContext context) {
    final justificacionProvider = Provider.of<JustificacionProvider>(context);
    final List<Justificacion> listaJustificacion =
        justificacionProvider.listaJustificacion;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Justificacion'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: JustificacionSearchDelegate(listaJustificacion));
            },
          )
        ],
      ),
      drawer: const MenuLateral(),
      body: Container(
        width: double.infinity,
        height: size.height * 0.7,
        color: Colors.white,
        child: Swiper(
          itemCount: listaJustificacion.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.7,
          itemBuilder: (BuildContext contex, int index) {
            return _cardJustificacion(listaJustificacion[index]);
            // return Card();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "ruta_justificacion_form");
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class _cardJustificacion extends StatelessWidget {
  final Justificacion justificacion;

  _cardJustificacion(this.justificacion);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(top: 134, bottom: 20),
        // color: Colors.amberAccent,
        width: double.infinity,
        height: size.height,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _ImagenFondo(justificacion),
            _EtiquetaPrecio(justificacion)
          ],
        ));
  }
}

class _ImagenFondo extends StatelessWidget {
  final Justificacion justificacion;
  _ImagenFondo(this.justificacion);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(justificacion.imagen),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _EtiquetaPrecio extends StatelessWidget {
  final Justificacion justificacion;
  _EtiquetaPrecio(this.justificacion);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          color: Colors.amber),
      child: ListTile(
        leading: Text(
          justificacion.motivo,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        title: Text(
          justificacion.detalle,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        subtitle: Text(
          justificacion.estado,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 105, 64, 255)),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'ruta_justificacion_form',
                arguments: justificacion);
          },
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ]);
