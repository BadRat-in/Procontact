import 'package:flutter/material.dart';
import 'package:procontact/res/files.dart';

class EditCont extends StatefulWidget {
  @override
  _EditContState createState() => _EditContState();
}

class _EditContState extends State<EditCont> {
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
    super.initState();
    // TODO: implement initState
    getfont();
  }

  getfont() async {
    String strfontNumber = await Savefile.readfontfile();
    setState(() {
      fontNumber = data['font'];
      if (fontNumber == 0) {
        fontNumber = int.parse(strfontNumber);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: (fontNumber == 0 || fontNumber == null)
            ? Text("Edit")
            : Text(
                'Edit',
                style: TextStyle(fontFamily: font_family.elementAt(fontNumber)),
              ),
        backgroundColor: Colors.teal,
        actions: [
          FlatButton(
            child: (fontNumber == 0 || fontNumber == null)
                ? Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  )
                : Text(
                    'Save',
                    style: TextStyle(
                        fontFamily: font_family.elementAt(fontNumber),
                        color: Colors.white),
                  ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
