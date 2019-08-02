import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/animated_container.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/cards_page.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/input_page.dart';
import 'package:components/src/pages/listview.dart';
import 'package:components/src/pages/login_page.dart';
import 'package:components/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

Map <String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder> {
    '/' : ( BuildContext context ) => HomePage(),
    'alert' : ( BuildContext context ) => AlertPage(),
    'avatar' : ( BuildContext context ) => AvatarPage(),
    'card' : ( BuildContext context ) => CardPage(),
    'animatedContainer' : ( BuildContext context ) => AnimatedContainerPage(),
    'inputs' : ( BuildContext context ) => InputPage(),
    'sliders' : ( BuildContext context ) => SliderPage(),
    'login' : ( BuildContext context ) => LoginPage(),
    'list' : ( BuildContext context ) => ListPage(),
  };
}
