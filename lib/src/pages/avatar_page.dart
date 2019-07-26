import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://mappingthejourney.com/wp-content/uploads/2017/08/Ryan.png'),
              radius: 30.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('JD'),
            )
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/loader.gif'),
          image: NetworkImage('http://rapapa.net/wp/wp-content/uploads/2014/12/1398391371178-0-2.jpg'),
        ),
      ),
    );
  }
}
