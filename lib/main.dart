import 'package:flutter/material.dart';
import 'package:procontact/ideas/idea.dart';
import 'package:procontact/ideas/new_idea.dart';
import 'package:procontact/notes/new_note.dart';
import 'package:procontact/res/changeFont.dart';
import 'package:procontact/contact_list/detail.dart';
import 'package:procontact/contact_list/new_cont.dart';
import 'package:procontact/loading.dart';
import 'package:procontact/notes/note.dart';
import 'package:procontact/res/files.dart';
import 'package:procontact/res/theme.dart';
import 'package:provider/provider.dart';
import 'package:procontact/contact_list/edit.dart';
import 'package:procontact/contact_list/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var _gettheme;
  // This widget is the root of your application.
  @override
  void initState() async {
    _gettheme = Savefile.readthemefile();
    print(_gettheme);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
        create: (_) {
          _gettheme = Savefile.readthemefile();
          if (_gettheme == 'true') {
            return ThemeChanger(ThemeData.dark());
          } else {
            return ThemeChanger(ThemeData.light());
          }
        },
        child: MaterialAppWithTheme());
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      initialRoute: '/loading',
      routes: {
        "/detail": (context) => Detail(),
        "/new_cont": (context) => NewCont(),
        "/loading": (context) => LoadingScreen(),
        '/changeFont': (context) => FontChange(),
        '/edit': (context) => EditCont(),
        '/home': (context) => MyHomePage(),
        '/note': (context) => Note(),
        '/ideas': (context) => Idea(),
        'new_idea': (context) => New_Idea(),
        'new_note': (context) => New_Note(),
      },
      theme: theme.getTheme(),
    );
  }
}
