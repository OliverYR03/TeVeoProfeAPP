import 'package:flutter/material.dart';
import 'package:flutter_application_te_veo_profe/widgets/menu_lateral.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  createState() => _PrincipalScreen();
}

class _PrincipalScreen extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Principal'),
        ),
        drawer: const MenuLateral(),
        body: Center(
          child: ListView(children: [
            Card(
              child: Column(
                children: const <Widget>[
                  ListTile(
                      leading: Icon(Icons.laptop), title: Text('LAPTOP LENOVO'))
                ],
              ),
            ),
          ]),
        ));
  }
}
