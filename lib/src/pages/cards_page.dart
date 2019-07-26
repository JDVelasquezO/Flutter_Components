import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          _card1(),
          SizedBox( height: 30.0, ),
          _card2(),
          SizedBox( height: 30.0, ),
          _card1(),
          SizedBox( height: 30.0, ),
          _card2(),
          _card1(),
          SizedBox( height: 30.0, ),
          _card2(),
          _card1(),
          SizedBox( height: 30.0, ),
          _card2(),
          _card1(),
          SizedBox( height: 30.0, ),
          _card2(),
          _card1(),
          SizedBox( height: 30.0, ),
          _card2(),
        ],
      ),
    );
  }

  Widget _card1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blueAccent, ),
            title: Text('Título 1'),
            subtitle: Text('Descripción de la targeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _card2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
            placeholder: AssetImage('assets/loader.gif'),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          Container( 
            padding: EdgeInsets.all(10.0), 
            child: Text('Aquí hay un texto'), 
          )
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
    );
  }
}