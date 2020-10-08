import 'package:componentes/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _listItems(snapshot.data),);
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data) {
    final List<Widget> opciones = [];
    data.forEach((opcion) {
      final ListTile widgetTemp = ListTile(
        title: Text(opcion['texto']),
        leading: Icon(Icons.account_circle, color: Colors.blue,),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: () {},
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
