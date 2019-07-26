import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {

  List<dynamic> options = [];

  _MenuProvider () {
    //chargueData();
  }

  Future<List<dynamic>> chargueData() async {
    final data = await rootBundle.loadString('data/menu_opts.json'); 
    Map dataMap = json.decode( data );
    options = dataMap['rutas'];

    return options;
  }

}

final menuProvider = new _MenuProvider();
