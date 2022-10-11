import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../models/register.dart';
import '../provider/register_provider.dart';
import '../search/register_search_delegate.dart';
import '../widgets/menu_lateral.dart';
import 'package:provider/provider.dart';

class RegisterFormScreen extends StatefulWidget {
  @override
  createState() => _RegisterFormScreen();
}

class _RegisterFormScreen extends State<RegisterFormScreen> {
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    final List<Register> listaRegister = registerProvider.listaRegister;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('USUARIOS CREADOS'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: RegisterSearchDelegate(listaRegister));
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
          itemCount: listaRegister.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.7,
          itemBuilder: (BuildContext context, int index) {
            return _cardRegister(listaRegister[index]);
          },
        ),
      ),
    );
  }
}

class _cardRegister extends StatelessWidget {
  final Register register;
  _cardRegister(this.register);
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
        children: [_ImagenFondo(register), _Nombrecorr(register)],
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  final Register register;
  _ImagenFondo(this.register);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(register.imagen),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _Nombrecorr extends StatelessWidget {
  final Register register;
  _Nombrecorr(this.register);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          color: Colors.purple),
      child: ListTile(
        title: Text(
          register.nombApellido,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(
          register.corr,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'ruta_register', arguments: register);
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
