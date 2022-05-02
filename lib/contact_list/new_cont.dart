import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:procontact/res/files.dart';
import 'package:procontact/res/theme.dart';
import 'package:provider/provider.dart';

class NewCont extends StatefulWidget {
  @override
  _NewContState createState() => _NewContState();
}

class _NewContState extends State<NewCont> {
  var _image, _imagebackground;
  Map data = {};
  bool followup1 = false,
      followup2 = false,
      followup3 = false,
      followup4 = false,
      followup5 = false;
  Iterable<Item> number4 = [];
  Contact newcontact = Contact();
  int fontNumber = 0;
  TextEditingController name = TextEditingController();
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  TextEditingController number3 = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController currentaddress = TextEditingController();
  TextEditingController permanentaddress = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController sponsor = TextEditingController();
  TextEditingController department = TextEditingController();
  List number = [];
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
    name.addListener(() {
      getname();
    });
    number1.addListener(() {
      getnumber();
    });
    number2.addListener(() {
      getnumber2();
    });
    number3.addListener(() {
      getnumber3();
    });
    email.addListener(() {
      getemial();
    });
    permanentaddress.addListener(() {
      getpermanentaddress();
    });
    currentaddress.addListener(() {
      getcurrentaddress();
    });
    age.addListener(() {
      getdepartment();
    });
    sponsor.addListener(() {
      getsponsor();
    });
    department.addListener(() {
      getage();
    });
    occupation.addListener(() {
      getOccupation();
    });
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

  getname() {
    newcontact.displayName = name.text;
  }

  getnumber() {
    print(number1.text);
  }

  getnumber2() {
    print(number2.text);
  }

  getnumber3() {
    print(number3.text);
  }

  getOccupation() {
    print(occupation.text);
  }

  getemial() {
    // newcontact.emails =
  }

  getpermanentaddress() {
    print(permanentaddress.text);
  }

  getcurrentaddress() {
    print(currentaddress.text);
  }

  getsponsor() {
    print(sponsor.text);
  }

  getage() {
    print(age.text);
  }

  getdepartment() {
    print(department.text);
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    ThemeChanger _themechanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: (fontNumber == 0 || fontNumber == null)
            ? Text("New Contact")
            : Text(
                'New Contact',
                style: TextStyle(fontFamily: font_family.elementAt(fontNumber)),
              ),
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
              // newcontact.phones = number4;
              print(newcontact.phones.elementAt(0).value);
              getname();
              getnumber();
              getnumber2();
              getnumber3();
              getemial();
              getcurrentaddress();
              getpermanentaddress();
              getage();
              getsponsor();
              getdepartment();
              getOccupation();
              // await ContactsService.addContact(newcontact);
            },
          )
        ],
        backgroundColor: Colors.teal,
      ),
      body: (_themechanger.getTheme() == ThemeData.light())
          ? Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                            child: (_image == null)
                                ? CircleAvatar(
                                    radius: 35,
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.photo_camera_rounded,
                                          color: Colors.blueGrey[900],
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          var image =
                                              await ImagePicker.pickImage(
                                                  source: ImageSource.gallery);

                                          setState(() {
                                            _image = image;
                                          });
                                        }),
                                    backgroundColor: Colors.lightBlue[100],
                                  )
                                : Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: FileImage(_image),
                                            fit: BoxFit.cover)),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.add_a_photo,
                                          color: Colors.blueGrey[900],
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          var image =
                                              await ImagePicker.pickImage(
                                                  source: ImageSource.gallery);

                                          setState(() {
                                            _image = image;
                                          });
                                        }),
                                  ))),
                    Column(
                      // padding: EdgeInsets.all(20),
                      children: [
                        _build_textfield_light(
                            'Name',
                            Icon(Icons.account_circle, color: Colors.blue[900]),
                            name),
                        SizedBox(
                          height: 13,
                        ),
                        _build_numfield_light(
                            'Number 1',
                            Icon(Icons.phone, color: Colors.blue[900]),
                            number1),
                        SizedBox(
                          height: 13,
                        ),
                        _build_numfield_light(
                            'Number 2',
                            Icon(Icons.phone, color: Colors.blue[900]),
                            number2),
                        SizedBox(
                          height: 13,
                        ),
                        _build_numfield_light(
                            'Number 3',
                            Icon(Icons.phone, color: Colors.blue[900]),
                            number3),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_light('Email',
                            Icon(Icons.mail, color: Colors.blue[900]), email),
                        SizedBox(
                          height: 13,
                        ),
                        _build_numfield_light('Age',
                            Icon(Icons.person, color: Colors.blue[900]), age),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_light(
                            'Sponsor',
                            Icon(Icons.workspaces_filled,
                                color: Colors.blue[900]),
                            sponsor),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_light(
                            'Occupation',
                            Icon(Icons.work, color: Colors.blue[900]),
                            occupation),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_light(
                            'Department',
                            Icon(Icons.home_work_outlined,
                                color: Colors.blue[900]),
                            department),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_light(
                            'Permanent Address',
                            Icon(Icons.location_pin, color: Colors.blue[900]),
                            permanentaddress),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_light(
                            'Current Address',
                            Icon(Icons.location_pin, color: Colors.blue[900]),
                            currentaddress),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Container(
              color: Colors.black54,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                            child: (_image == null)
                                ? CircleAvatar(
                                    radius: 35,
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.photo_camera_rounded,
                                          color: Colors.blueGrey[900],
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          var image =
                                              await ImagePicker.pickImage(
                                                  source: ImageSource.gallery);

                                          setState(() {
                                            _image = image;
                                          });
                                        }),
                                    backgroundColor: Colors.lightBlue[100],
                                  )
                                : Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: FileImage(_image),
                                            fit: BoxFit.cover)),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.add_a_photo,
                                          color: Colors.blueGrey[900],
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          var image =
                                              await ImagePicker.pickImage(
                                                  source: ImageSource.gallery);

                                          setState(() {
                                            _image = image;
                                          });
                                        }),
                                  ))),
                    Column(
                      // padding: EdgeInsets.all(20),
                      children: [
                        _build_textfield_dark(
                            'Name',
                            Icon(Icons.account_circle,
                                color: Colors.blueAccent[700]),
                            name),
                        SizedBox(
                          height: 13,
                        ),
                        _build_numfield_dark(
                            'Number 1',
                            Icon(Icons.phone, color: Colors.blueAccent[700]),
                            number1),
                        SizedBox(
                          height: 13,
                        ),
                        _build_numfield_dark(
                            'Number 2',
                            Icon(Icons.phone, color: Colors.blueAccent[700]),
                            number2),
                        SizedBox(
                          height: 13,
                        ),
                        _build_numfield_dark(
                            'Number 3',
                            Icon(Icons.phone, color: Colors.blueAccent[700]),
                            number3),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_dark(
                            'Email',
                            Icon(Icons.mail, color: Colors.blueAccent[700]),
                            email),
                        SizedBox(
                          height: 13,
                        ),
                        _build_numfield_dark(
                            'Age',
                            Icon(Icons.person, color: Colors.blueAccent[700]),
                            age),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_dark(
                            'Sponsor',
                            Icon(Icons.workspaces_filled,
                                color: Colors.blueAccent[700]),
                            sponsor),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_dark(
                            'Occupation',
                            Icon(Icons.work, color: Colors.blueAccent[700]),
                            occupation),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_dark(
                            'Department',
                            Icon(Icons.home_work_outlined,
                                color: Colors.blueAccent[700]),
                            department),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_dark(
                            'Permanent Address',
                            Icon(Icons.location_pin,
                                color: Colors.blueAccent[700]),
                            permanentaddress),
                        SizedBox(
                          height: 13,
                        ),
                        _build_textfield_dark(
                            'Current Address',
                            Icon(Icons.location_pin,
                                color: Colors.blueAccent[700]),
                            currentaddress),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _build_textfield_light(
      String text, Icon iconName, TextEditingController Controller) {
    return TextField(
      controller: Controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)), gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)), gapPadding: 0),
        prefixIcon: iconName,
        labelText: text,
        labelStyle: (fontNumber == 0 || fontNumber == null)
            ? null
            : TextStyle(
                fontFamily: font_family.elementAt(fontNumber),
                color: Colors.blue[500]),
      ),
    );
  }

  Widget _build_numfield_light(
      String text, Icon iconName, TextEditingController Controller) {
    return TextField(
      controller: Controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)), gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)), gapPadding: 0),
        prefixIcon: iconName,
        labelText: text,
        labelStyle: (fontNumber == 0 || fontNumber == null)
            ? null
            : TextStyle(
                fontFamily: font_family.elementAt(fontNumber),
                color: Colors.blue[500]),
      ),
    );
  }

  Widget _build_textfield_dark(
      String text, Icon iconName, TextEditingController Controller) {
    return TextField(
      controller: Controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)), gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)), gapPadding: 0),
        prefixIcon: iconName,
        labelText: text,
        labelStyle: (fontNumber == 0 || fontNumber == null)
            ? null
            : TextStyle(fontFamily: font_family.elementAt(fontNumber)),
      ),
    );
  }

  Widget _build_numfield_dark(
      String text, Icon iconName, TextEditingController Controller) {
    return TextField(
      controller: Controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)), gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)), gapPadding: 0),
        prefixIcon: iconName,
        labelText: text,
        labelStyle: (fontNumber == 0 || fontNumber == null)
            ? null
            : TextStyle(fontFamily: font_family.elementAt(fontNumber)),
      ),
    );
  }
}
