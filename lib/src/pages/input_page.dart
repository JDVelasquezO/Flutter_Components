import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _email = '';
  String _date = '';
  String _opcSelected = 'IPC 1';

  TextEditingController _inputFieldDateController = new TextEditingController();
  List _courses = ['IPC 1', 'Logica de Sistemas', 'Calculo Multivariable', 'Matemática para computación 1'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 20.0
        ),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Cantidad de letras: ${_name.length}'),
        hintText: 'Escribe tu nombre de usuario',
        labelText: 'Nombre',
        helperText: 'JD_123',
        suffixIcon: Icon( Icons.accessibility_new ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: ( value ) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Cantidad de letras: ${_email.length}'),
        hintText: 'Escribe tu correo',
        labelText: 'Correo Electrónico',
        suffixIcon: Icon( Icons.alternate_email ),
        icon: Icon( Icons.email )
      ),
      onChanged: ( value ) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
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
    );
  }
  
  List<DropdownMenuItem<String>> getOptionsDropdown() {
    
    List<DropdownMenuItem<String>> list = new List();
    _courses.forEach((course) => {
      list.add( DropdownMenuItem(
        child: Text(course),
        value: course,
      ))
    });

    return list;
  }

  Widget _createDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox( width: 30.0, ),
        DropdownButton(
          value: _opcSelected,
          items: getOptionsDropdown(),
          onChanged: ( opt ) {
            setState(() {
            _opcSelected = opt; 
            });
          },
        )
      ],
    );

  }

  _createPerson() {
    return ListTile(
      title: Text('Nombre es $_name'),
      subtitle: Text('Correo es $_email'),
      leading: Text(_opcSelected),
    );
  }

  Widget _createDate( BuildContext context ) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon( Icons.calendar_today ),
        icon: Icon( Icons.calendar_view_day )
      ),
      onTap: () {
        FocusScope.of(context).requestFocus( new FocusNode() );
        _selectDate( context );
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2017),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }
}