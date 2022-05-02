import 'package:flutter/material.dart';
import 'package:procontact/res/theme.dart';
import 'package:provider/provider.dart';

class New_Idea extends StatefulWidget {
  @override
  _New_IdeaState createState() => _New_IdeaState();
}

class _New_IdeaState extends State<New_Idea> {
  Map data = {};
  TextEditingController title = TextEditingController(),
      idea = TextEditingController();
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
          padding: EdgeInsets.fromLTRB(10, 15, 10, 30),
          color: (_themeChanger.getTheme() == ThemeData.dark())
              ? Colors.black54
              : null,
          child: Column(
            children: [
              TextField(
                controller: title,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      gapPadding: 0),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gapPadding: 0),
                  prefixIcon: Icon(Icons.text_fields,
                      color: (_themeChanger.getTheme() == ThemeData.light())
                          ? Colors.blue[900]
                          : Colors.blueAccent[700]),
                  labelText: 'Title',
                  labelStyle: (_themeChanger.getTheme() == ThemeData.light())
                      ? (fontNumber == 0 || fontNumber == null)
                          ? TextStyle(color: Colors.blue[500])
                          : TextStyle(
                              fontFamily: font_family.elementAt(fontNumber),
                              color: Colors.blue[500])
                      : (fontNumber == 0 || fontNumber == null)
                          ? null
                          : TextStyle(
                              fontFamily: font_family.elementAt(fontNumber)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: idea,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      gapPadding: 0),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gapPadding: 0),
                  prefixIcon: Icon(Icons.text_fields,
                      color: (_themeChanger.getTheme() == ThemeData.light())
                          ? Colors.blue[900]
                          : Colors.blueAccent[700]),
                  labelText: 'Idea Discription',
                  labelStyle: (_themeChanger.getTheme() == ThemeData.light())
                      ? (fontNumber == 0 || fontNumber == null)
                          ? TextStyle(color: Colors.blue[500])
                          : TextStyle(
                              fontFamily: font_family.elementAt(fontNumber),
                              color: Colors.blue[500])
                      : (fontNumber == 0 || fontNumber == null)
                          ? null
                          : TextStyle(
                              fontFamily: font_family.elementAt(fontNumber)),
                ),
              ),
            ],
          ),
        ));
  }
}
