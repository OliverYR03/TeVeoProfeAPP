import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/asistencia.dart';
import '../provider/asistencia_provider.dart';
import '../search/asistencia_search_delegate.dart';
import '../widgets/menu_lateral.dart';

class AsistenciaScreen extends StatefulWidget {
  @override
  createState() => _AsistenciaScreen();
}

class _AsistenciaScreen extends State<AsistenciaScreen> {
  @override
  Widget build(BuildContext context) {
    final asistenciaProvider = Provider.of<AsistenciaProvider>(context);
    final List<Asistencia> listaAsistencia = asistenciaProvider.listaAsistencia;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Asistencia'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: AsistenciaSearchDelegate(listaAsistencia));
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
          itemCount: listaAsistencia.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.7,
          itemBuilder: (BuildContext context, int index) {
            return _cardAsistencia(listaAsistencia[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'ruta_asistencia_form');
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class _cardAsistencia extends StatelessWidget {
  final Asistencia asistencia;
  _cardAsistencia(this.asistencia);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 140, bottom: 20),
      width: double.infinity,
      height: size.height * 0.5,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [_ImagenFondo(asistencia), _EtiquetaPrecio(asistencia)],
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  final Asistencia asistencia;
  _ImagenFondo(this.asistencia);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(asistencia.imagen),

            //NetworkImage('https://placeimg.com/400/300/tech'),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _EtiquetaPrecio extends StatelessWidget {
  final Asistencia asistencia;
  _EtiquetaPrecio(this.asistencia);
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
          asistencia.seccioncurso,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        title: Text(
          asistencia.nombcurso,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        subtitle: Text(
          'Hora:  ' + asistencia.hora,
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
            Navigator.pushNamed(context, 'ruta_asistencia_form',
                arguments: asistencia);
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
