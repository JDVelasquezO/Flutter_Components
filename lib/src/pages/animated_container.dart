import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  // Properties to the container
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.redAccent;
  BorderRadiusGeometry _border = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animaciones'),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.ease,
          duration: Duration(
            milliseconds: 800
          ),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _border,
            color: _color
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.play_arrow ),
        onPressed: _changeForm,
      ),
    );
  }

  void _changeForm() {
    final random = Random();
    setState(() {
      _height = random.nextInt(300).toDouble();
      _width = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1); 

      _border = new BorderRadius.circular( random.nextInt(100).toDouble() );
    });
  }
}