import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
            _showAlert( context );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add_location ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert( BuildContext context ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: ( context ) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0)
          ),
          title: Text('Título de alerta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de alertas'),
              Container(
                margin: EdgeInsets.only( top: 20.0 ),
                child: FlutterLogo(
                  size: 80.0,
              ),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              textColor: Colors.red,
              onPressed: () => Navigator.of(context).pop()
            ),
            Container(
              margin: EdgeInsets.only( right: 20.0 ),
              child: FlatButton(
                child: Text('Aceptar'),
                textColor: Colors.blue,
                onPressed: () => Navigator.of(context).pop(),
              )

            )
          ],
        );
      }
    );
  }
}
