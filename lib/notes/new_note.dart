import 'package:flutter/material.dart';
import 'package:procontact/res/theme.dart';
import 'package:provider/provider.dart';

class New_Note extends StatefulWidget {
  @override
  _New_NoteState createState() => _New_NoteState();
}

class _New_NoteState extends State<New_Note> {
  Map data = {};
  int fontNumber = 1;
  List font_family = [
    0,
    "Lobster",
    "Dancing",
    "Sansita",
    "Googlemediumitalic",
    "Googleitalic"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getfont();
  }

  getfont() {
    setState(() {
      fontNumber = data['font'];
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
        appBar: AppBar(
          title: ((fontNumber == 0 || fontNumber == null)
              ? Text("New Idea")
              : Text(
                  'New Idea',
                  style:
                      TextStyle(fontFamily: font_family.elementAt(fontNumber)),
                )),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          color: (_themeChanger.getTheme() == ThemeData.dark())
              ? Colors.black54
              : null,
        ));
  }
}
