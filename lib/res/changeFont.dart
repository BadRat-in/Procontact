import 'package:flutter/material.dart';
import 'package:procontact/res/files.dart';
import 'package:procontact/res/theme.dart';
import 'package:provider/provider.dart';

class FontChange extends StatefulWidget {
  @override
  _FontChangeState createState() => _FontChangeState();
}

class _FontChangeState extends State<FontChange> {
  int fontNumber = 0;
  Map data = {};
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
    setState(() {
      fontNumber = data['font'];
    });
  }

  getfont() async {
    String strfontNumber = await Savefile.readfontfile();
    setState(() {
      fontNumber = int.parse(strfontNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
        appBar: AppBar(
          title: (fontNumber == 0 || fontNumber == null)
              ? Text(
                  'Choose Font',
                )
              : Text(
                  'Choose Font',
                  style:
                      TextStyle(fontFamily: font_family.elementAt(fontNumber)),
                ),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          color: (_themeChanger.getTheme() == ThemeData.dark())
              ? Colors.black54
              : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {
                  setState(() {
                    fontNumber = 0;
                    String strfontNumber = fontNumber.toString();
                    Savefile.savefontfile(strfontNumber);
                    Navigator.pop(context, {'num': fontNumber});
                  });
                },
                title: Text(
                  "Default",
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Radio(
                  value: 0,
                  groupValue: fontNumber,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      fontNumber = value;
                      String strfontNumber = fontNumber.toString();
                      Savefile.savefontfile(strfontNumber);
                      Navigator.pop(context, {'num': fontNumber});
                    });
                  },
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.black26,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    fontNumber = 1;
                    String strfontNumber = fontNumber.toString();
                    Savefile.savefontfile(strfontNumber);
                    Navigator.pop(context, {'num': fontNumber});
                  });
                },
                title: Text(
                  font_family.elementAt(1),
                  style: TextStyle(
                      fontFamily: font_family.elementAt(1), fontSize: 18.0),
                ),
                leading: Radio(
                  value: 1,
                  activeColor: Colors.green,
                  groupValue: fontNumber,
                  onChanged: (value) {
                    setState(() {
                      fontNumber = value;
                      String strfontNumber = fontNumber.toString();
                      Savefile.savefontfile(strfontNumber);
                      Navigator.pop(context, {'num': fontNumber});
                    });
                  },
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.black26,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    fontNumber = 2;
                    String strfontNumber = fontNumber.toString();
                    Savefile.savefontfile(strfontNumber);
                    Navigator.pop(context, {'num': fontNumber});
                  });
                },
                title: Text(
                  font_family.elementAt(2),
                  style: TextStyle(
                      fontFamily: font_family.elementAt(2), fontSize: 18.0),
                ),
                leading: Radio(
                  value: 2,
                  activeColor: Colors.green,
                  groupValue: fontNumber,
                  onChanged: (value) {
                    setState(() {
                      fontNumber = value;
                      String strfontNumber = fontNumber.toString();
                      Savefile.savefontfile(strfontNumber);
                      Navigator.pop(context, {'num': fontNumber});
                    });
                  },
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.black26,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    fontNumber = 3;
                    String strfontNumber = fontNumber.toString();
                    Savefile.savefontfile(strfontNumber);
                    Navigator.pop(context, {'num': fontNumber});
                  });
                },
                title: Text(
                  font_family.elementAt(3),
                  style: TextStyle(
                      fontFamily: font_family.elementAt(3), fontSize: 18.0),
                ),
                leading: Radio(
                  value: 3,
                  activeColor: Colors.green,
                  groupValue: fontNumber,
                  onChanged: (value) {
                    setState(() {
                      fontNumber = value;
                      String strfontNumber = fontNumber.toString();
                      Savefile.savefontfile(strfontNumber);
                      Navigator.pop(context, {'num': fontNumber});
                    });
                  },
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.black26,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    fontNumber = 5;
                    String strfontNumber = fontNumber.toString();
                    Savefile.savefontfile(strfontNumber);
                    Navigator.pop(context, {'num': fontNumber});
                  });
                },
                title: Text(
                  "Italic",
                  style: TextStyle(
                      fontFamily: font_family.elementAt(5), fontSize: 18.0),
                ),
                leading: Radio(
                  value: 5,
                  activeColor: Colors.green,
                  groupValue: fontNumber,
                  onChanged: (value) {
                    setState(() {
                      fontNumber = value;
                      String strfontNumber = fontNumber.toString();
                      Savefile.savefontfile(strfontNumber);
                      Navigator.pop(context, {'num': fontNumber});
                    });
                  },
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.black26,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    fontNumber = 4;
                    String strfontNumber = fontNumber.toString();
                    Savefile.savefontfile(strfontNumber);
                    Navigator.pop(context, {'num': fontNumber});
                  });
                },
                title: Text(
                  "Italic Bold",
                  style: TextStyle(
                      fontFamily: font_family.elementAt(4), fontSize: 18.0),
                ),
                leading: Radio(
                  value: 4,
                  activeColor: Colors.green,
                  groupValue: fontNumber,
                  onChanged: (value) {
                    setState(() {
                      fontNumber = value;
                      String strfontNumber = fontNumber.toString();
                      Savefile.savefontfile(strfontNumber);
                      Navigator.pop(context, {'num': fontNumber});
                    });
                  },
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.black26,
              ),
            ],
          ),
        ));
  }
}
