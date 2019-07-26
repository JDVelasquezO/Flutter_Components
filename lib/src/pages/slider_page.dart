import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valueSlider = 200.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Sliders'),
       ),
       body: Container(
         padding: EdgeInsets.only(top: 50.0),
         child: Column(
           children: <Widget>[
             _createSlider(),
             _createCheckBox(),
             _createSwitch(),
             Expanded(
               child: _createImage(),
             ),
           ],
         ),
       ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: ( _blockCheck ) ? null : (value) { // Ternary oeprator
        setState(() {
          _valueSlider = value;
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://static.frontendmasters.com/assets/videos/promo/vv37upjqom/360.jpg'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
         _blockCheck = value; 
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
         _blockCheck = value; 
        });
      },
    );
  }
}