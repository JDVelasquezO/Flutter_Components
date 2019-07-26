import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email = '', pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wallpaper.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _createLogo(),
          _createForm(),
        ],
      ),
    );
  }

  _createForm() {
    return Positioned(
      top: 200.0,
      left: 10.0,
      right: 10.0,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Column(
          children: <Widget>[
            _createTitle(),
            _createEmail(),
            _createPass(),
            _createButtonLogin(),
            _createButtonLoginFacebook()
          ],
        ),
      ),
    );
  }

  _createLogo() {
    return Positioned(
      top: 50.0,
      left: 10.0,
      right: 10.0,
      child: Image(
        image: AssetImage('assets/logo.png'),
        height: 100.0,
      ),
    );
  }

  _createTitle() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  _createEmail() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Escribe tu correo',
          labelText: 'Correo Electrónico',
          suffixIcon: Icon( Icons.alternate_email ),
          icon: Icon( Icons.email ),
        ),
      ),
    );
  }

  _createPass() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Contraseña',
          labelText: 'Password',
          suffixIcon: Icon( Icons.lock ),
          icon: Icon( Icons.lock_outline )
        ),
      ),
    );
  }

  _createButtonLogin() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: RaisedButton(
        child: Text('Iniciar Sesión'),
        color: Colors.lightBlue,
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () {
          _showAlert(context);
        },
      ),
    );
  }

  _createButtonLoginFacebook() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RaisedButton(
        child: Text('Facebook'),
        color: Colors.blue,
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () {},
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
          title: Text('Datos ingresados'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Tu correo ingresado es $email'),
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