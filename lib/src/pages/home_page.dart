import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icons_string_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
      future: menuProvider.chargueData(),
      initialData: [],
      builder: ( BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ) {
        return ListView(
          children: _listItems( snapshot.data, context ),
        );
      },
    );
  }

  List<Widget> _listItems( List<dynamic> data, BuildContext context ) {
      final List<Widget> opts = [];
      data.forEach((opt) {
        final widgetTemp = ListTile(
          title: Text(opt['texto']),
          leading: getIcon(opt['icon']),
          trailing: Icon( Icons.keyboard_arrow_down, color: Colors.blueAccent ),
          onTap: () {
            Navigator.pushNamed(context, opt['ruta']);
          },
        );

        opts..add( widgetTemp )
            ..add( Divider() );
      });

      return opts;
    }
}