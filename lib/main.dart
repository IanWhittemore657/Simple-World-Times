import 'package:flutter/material.dart';
import 'package:worldtimes/pages/choose_location.dart';
import 'package:worldtimes/pages/home.dart';
import 'package:worldtimes/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute:"/" ,

  routes:{
    "/":(context) => Loading(),
    "/home":(context) => Home(),
    "/location":(context) => ChooseLocation(),
  },
));
