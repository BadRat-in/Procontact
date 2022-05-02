import 'dart:async';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:procontact/res/files.dart';
import 'package:procontact/res/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _key = GlobalKey();
  ScrollController _rrectController = ScrollController();
  String func = 'main';
  bool change = false, _isSearching = false;
  String gettheme;
  String change_string;
  Map data = {};
  int fontNumber = 0;
  var _image;
  List font_family = [
    0,
    "Lobster",
    "Dancing",
    "Sansita",
    "Googlemediumitalic",
    "Googleitalic"
  ];
  bool check_contect = false;
  List<Contact> Contacts;
  List<Contact> filterdContacts;
  TextEditingController searchcontact = new TextEditingController();
  String text, ignore;
  PermissionHandler _permissionHandler = PermissionHandler();
  var result, result1, result2, result3, count;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
    getthemedata();
    searchcontact.addListener(() {
      isContact();
    });
  }

  getthemedata() async {
    gettheme = await Savefile.readthemefile();
    String strfontNumber = await Savefile.readfontfile();
    setState(() {
      fontNumber = int.parse(strfontNumber);
    });
    if (gettheme == 'true') {
      setState(() {
        change = true;
      });
    } else {
      setState(() {
        change = false;
      });
    }
    setthemedata();
  }

  setthemedata() async {
    ThemeChanger _themechanger = Provider.of<ThemeChanger>(context);
    if (gettheme == 'true') {
      await _themechanger.setTheme(ThemeData.dark());
    } else {
      await _themechanger.setTheme(ThemeData.light());
    }
  }

  getPermission() async {
    result1 =
        await _permissionHandler.requestPermissions([PermissionGroup.storage]);
    result2 =
        await _permissionHandler.requestPermissions([PermissionGroup.location]);
    result =
        await _permissionHandler.requestPermissions([PermissionGroup.contacts]);
    result3 =
        await _permissionHandler.requestPermissions([PermissionGroup.phone]);
    get_all();
  }

  isContact() {
    text = searchcontact.text;
    print(text);
    List<Contact> _contacts = [];
    List<Contact> _contacts1 = [];
    List<Contact> _contacts2 = [];
    List<Contact> _contacts3 = [];
    List<Contact> _contacts4 = [];
    List<Contact> _contacts5 = [];
    List<Contact> _contacts6 = [];
    _contacts.addAll(Contacts);
    _contacts1.addAll(Contacts);
    _contacts2.addAll(Contacts);
    _contacts3.addAll(Contacts);
    _contacts4.addAll(Contacts);
    _contacts5.addAll(Contacts);
    _contacts6.addAll(Contacts);
    if (searchcontact.text.isNotEmpty) {
      _contacts.retainWhere((element) {
        String search_name = searchcontact.text.toLowerCase();
        if (searchcontact.text.isNotEmpty) {
          String searchbyname = element.displayName.toLowerCase();
          check_contect = true;
          return searchbyname.contains(search_name);
        }
      });
    }
    if (searchcontact.text.isNotEmpty) {
      _contacts1.retainWhere((element) {
        String search_name = searchcontact.text.toLowerCase();
        if (searchcontact.text.isNotEmpty) {
          String searchbycontact1 =
              element.phones.elementAt(0).value.toLowerCase();
          check_contect = true;
          return searchbycontact1.contains(search_name);
        }
      });
    }
    if (searchcontact.text.isNotEmpty) {
      _contacts2.retainWhere((element) {
        String search_name = searchcontact.text.toLowerCase();
        if (searchcontact.text.isNotEmpty) {
          if (element.phones.length > 1) {
            String searchbycontact2 =
                element.phones.elementAt(1).value.toLowerCase();
            check_contect = true;
            return searchbycontact2.contains(search_name);
          }
        }
      });
    }
    if (searchcontact.text.isNotEmpty) {
      _contacts3.retainWhere((element) {
        String search_name = searchcontact.text.toLowerCase();
        if (searchcontact.text.isNotEmpty) {
          if (element.phones.length > 2) {
            String searchbycontact3 =
                element.phones.elementAt(2).value.toLowerCase();
            check_contect = true;
            return searchbycontact3.contains(search_name);
          }
        }
      });
    }
    if (searchcontact.text.isNotEmpty) {
      _contacts4.retainWhere((element) {
        String search_name = searchcontact.text.toLowerCase();
        if (searchcontact.text.isNotEmpty) {
          if (element.emails.length > 0) {
            String searchbyemail =
                element.emails.elementAt(0).value.toLowerCase();
            check_contect = true;
            return searchbyemail.contains(search_name);
          }
        }
      });
    }
    if (searchcontact.text.isNotEmpty) {
      _contacts4.retainWhere((element) {
        String search_name = searchcontact.text.toLowerCase();
        if (searchcontact.text.isNotEmpty) {
          if (element.jobTitle != null) {
            String searchbyjob = element.jobTitle.toLowerCase();
            check_contect = true;
            return searchbyjob.contains(search_name);
          }
        }
      });
    }
    if (searchcontact.text.isNotEmpty) {
      _contacts5.retainWhere((element) {
        String search_name = searchcontact.text.toLowerCase();
        if (searchcontact.text.isNotEmpty) {
          if (element.postalAddresses.length > 0) {
            String searchbyAddresses =
                element.postalAddresses.elementAt(0).toString();
            String searchbypostal = searchbyAddresses.toLowerCase();

            check_contect = true;
            return searchbypostal.contains(search_name);
          }
        }
      });
    }
    if (searchcontact.text.isNotEmpty) {
      _contacts5.retainWhere((element) {
        String search_name = searchcontact.text.toLowerCase();
        if (searchcontact.text.isNotEmpty) {
          if (element.postalAddresses.length > 1) {
            String searchbyAddresses =
                element.postalAddresses.elementAt(1).toString();
            String searchbypostal = searchbyAddresses.toLowerCase();

            check_contect = true;
            return searchbypostal.contains(search_name);
          }
        }
      });
    }
    _contacts.addAll(_contacts5);
    _contacts.addAll(_contacts4);
    _contacts.addAll(_contacts3);
    _contacts.addAll(_contacts2);
    _contacts.addAll(_contacts1);
    setState(() {
      filterdContacts = _contacts;
    });
  }

  Future<Null> makerefresh() async {
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    setState(() {
      Contacts = _contacts;
    });
    return null;
  }

  get_all() async {
    if (result[PermissionGroup.contacts] == PermissionStatus.granted &&
        result2[PermissionGroup.location] == PermissionStatus.granted &&
        result1[PermissionGroup.storage] == PermissionStatus.granted &&
        result3[PermissionGroup.phone] == PermissionStatus.granted) {
      List<Contact> _contacts = (await ContactsService.getContacts()).toList();
      setState(() {
        Contacts = _contacts;
      });
    } else {
      result1 = await _permissionHandler
          .requestPermissions([PermissionGroup.storage]);
      result2 = await _permissionHandler
          .requestPermissions([PermissionGroup.location]);
      result = await _permissionHandler
          .requestPermissions([PermissionGroup.contacts]);
      if (result[PermissionGroup.contacts] != PermissionStatus.granted &&
          result2[PermissionGroup.location] != PermissionStatus.granted &&
          result1[PermissionGroup.storage] != PermissionStatus.granted &&
          result3[PermissionGroup.phone] == PermissionStatus.granted) {}
    }
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (searchcontact == null || searchcontact.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            searchcontact.clear();
          },
        ),
      ];
    }

    return <Widget>[
      new IconButton(
        icon: const Icon(
          Icons.person_search,
          color: Colors.white,
          size: 30,
        ),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    searchcontact.clear();

    setState(() {
      _isSearching = false;
    });
  }

  Widget _buildSearchField() {
    return new TextField(
      controller: searchcontact,
      autofocus: true,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: isContact(),
    );
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    ThemeChanger _themechanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
        appBar: AppBar(
          title: (_isSearching)
              ? _buildSearchField()
              : ((fontNumber == 0 || fontNumber == null)
                  ? Text("Contact List")
                  : Text(
                      'contact List',
                      style: TextStyle(
                          fontFamily: font_family.elementAt(fontNumber)),
                    )),
          backgroundColor: Colors.teal,
          leading: (_isSearching)
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                )
              : null,
          actions: _buildActions(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.person_add,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/new_cont',
                arguments: {'font': fontNumber});
          },
          backgroundColor: Colors.brown,
        ),
        drawer: Drawer(
          child: SafeArea(
            child: Container(
              color: (_themechanger.getTheme() == ThemeData.dark())
                  ? Colors.black54
                  : null,
              child: ListView(children: [
                DrawerHeader(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/settings.png'),
                      backgroundColor: Colors.black87,
                      radius: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    (fontNumber == 0 || fontNumber == null)
                        ? Text(
                            'Settings',
                            style: TextStyle(fontSize: 28),
                          )
                        : Text(
                            'Settings',
                            style: (TextStyle(
                                fontFamily: font_family.elementAt(fontNumber),
                                fontSize: 28)),
                          )
                  ],
                )),
                ListTile(
                    title: (fontNumber == 0 || fontNumber == null)
                        ? Text('Contact List',
                            style: TextStyle(
                              // fontFamily: font_family.elementAt(0),
                              fontSize: 18.0,
                            ))
                        : Text(
                            "Contact List",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: font_family.elementAt(fontNumber)),
                          ),
                    leading: Icon(
                      Icons.contacts,
                      color: Colors.blue[800],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                ListTile(
                    title: (fontNumber == 0 || fontNumber == null)
                        ? Text('Notes',
                            style: TextStyle(
                              // fontFamily: font_family.elementAt(0),
                              fontSize: 18.0,
                            ))
                        : Text(
                            "Notes",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: font_family.elementAt(fontNumber)),
                          ),
                    leading: Icon(
                      Icons.notes,
                      color: Colors.blue[800],
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/note',
                          arguments: {'font': fontNumber});
                    }),
                ListTile(
                    title: (fontNumber == 0 || fontNumber == null)
                        ? Text('Ideas',
                            style: TextStyle(
                              // fontFamily: font_family.elementAt(0),
                              fontSize: 18.0,
                            ))
                        : Text(
                            "Ideas",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: font_family.elementAt(fontNumber)),
                          ),
                    leading: Icon(
                      Icons.lightbulb,
                      color: Colors.blue[800],
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/ideas',
                          arguments: {'font': fontNumber});
                    }),
                Divider(
                  height: 0,
                  thickness: 1,
                  color: (_themechanger.getTheme() == ThemeData.light())
                      ? Colors.grey[300]
                      : Colors.grey[800],
                ),
                ListTile(
                    title: (fontNumber == 0 || fontNumber == null)
                        ? Text('Choose Font',
                            style: TextStyle(
                              // fontFamily: font_family.elementAt(0),
                              fontSize: 18.0,
                            ))
                        : Text(
                            "Choose Font",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: font_family.elementAt(fontNumber)),
                          ),
                    leading: Text(
                      '  F',
                      style: TextStyle(
                          fontFamily: font_family.elementAt(1),
                          // fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onTap: () async {
                      dynamic number = await Navigator.pushNamed(
                        context,
                        '/changeFont',
                      );
                      setState(() {
                        fontNumber = number['num'];
                      });
                      Navigator.pop(context);
                    }),
                ListTile(
                    title: (fontNumber == 0 || fontNumber == null)
                        ? Text('BackGround Image',
                            style: TextStyle(
                              // fontFamily: font_family.elementAt(0),
                              fontSize: 18.0,
                            ))
                        : Text(
                            'BackGround Image',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: font_family.elementAt(fontNumber)),
                          ),
                    leading: (_themechanger.getTheme() == ThemeData.light())
                        ? Icon(
                            Icons.add_a_photo,
                            color: Colors.black87,
                          )
                        : Icon(Icons.add_a_photo),
                    onTap: () async {
                      var image = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                      print(image);
                      setState(() {
                        _image = image;
                        // Savefile.savebackgroundimg(image);
                      });
                      Navigator.pop(context);
                    }),
                ListTile(
                    title: (_themechanger.getTheme() == ThemeData.light())
                        ? ((fontNumber == 0 || fontNumber == null)
                            ? Text('Dark Theme',
                                style: TextStyle(
                                  // fontFamily: font_family.elementAt(0),
                                  fontSize: 18.0,
                                ))
                            : Text(
                                "Dark Theme",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily:
                                        font_family.elementAt(fontNumber)),
                              ))
                        : ((fontNumber == 0 || fontNumber == null)
                            ? Text('Light Theme',
                                style: TextStyle(
                                  // fontFamily: font_family.elementAt(0),
                                  fontSize: 18.0,
                                ))
                            : Text(
                                "Light Theme",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily:
                                        font_family.elementAt(fontNumber)),
                              )),
                    leading: Text(
                      '  T',
                      style: TextStyle(
                          fontFamily: font_family.elementAt(1),
                          // fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: IconButton(
                        icon: (_themechanger.getTheme() == ThemeData.light())
                            ? Icon(
                                Icons.nightlight_round,
                                color: Colors.amber,
                              )
                            : Icon(
                                Icons.wb_sunny,
                                color: Colors.amber,
                              ),
                        onPressed: () {
                          if (_themechanger.getTheme() == ThemeData.light()) {
                            change_string = 'true';
                            Savefile.savethemefile(change_string);
                            _themechanger.setTheme(ThemeData.dark());
                          } else {
                            change_string = 'false';
                            Savefile.savethemefile(change_string);
                            _themechanger.setTheme(ThemeData.light());
                          }
                        },
                      ),
                    )),
                Divider(
                  height: 0,
                  thickness: 1,
                  color: (_themechanger.getTheme() == ThemeData.light())
                      ? Colors.grey[300]
                      : Colors.grey[800],
                ),
                ListTile(
                  title: (fontNumber == 0 || fontNumber == null)
                      ? Text('App Version 1.0',
                          style: TextStyle(
                            // fontFamily: font_family.elementAt(0),
                            fontSize: 18.0,
                          ))
                      : Text(
                          "App Version 1.0",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: font_family.elementAt(fontNumber)),
                        ),
                  leading: Icon(
                    Icons.android,
                    color: Colors.green,
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                  color: (_themechanger.getTheme() == ThemeData.light())
                      ? Colors.grey[300]
                      : Colors.grey[800],
                ),
              ]),
            ),
          ),
        ),
        body: (_themechanger.getTheme() == ThemeData.light())
            ? ((Contacts != null)
                ? Container(
                    color: (_image == null) ? Colors.white : null,
                    decoration: (_image != null)
                        ? BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(_image), fit: BoxFit.cover))
                        : null,
                    child: DraggableScrollbar.semicircle(
                      controller: _rrectController,
                      backgroundColor: Colors.grey[900],
                      heightScrollThumb: 50,
                      scrollbarAnimationDuration: Duration(milliseconds: 200),
                      scrollbarTimeToFade: Duration(milliseconds: 900),
                      child: ListView.builder(
                        controller: _rrectController,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        itemCount: (check_contect == true)
                            ? filterdContacts.length
                            : Contacts.length,
                        itemBuilder: (context, index) {
                          Contact contact = (check_contect == true)
                              ? filterdContacts[index]
                              : Contacts[index];
                          return ListTile(
                              trailing: IconButton(
                                iconSize: 35,
                                onPressed: () async {
                                  var number = contact.phones
                                      .elementAt(0)
                                      .value; //set the number here
                                  await FlutterPhoneDirectCaller.callNumber(
                                      number);
                                },
                                icon: Icon(Icons.call),
                                color: Colors.lightBlue,
                              ),
                              title: Text(
                                contact.displayName,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: (fontNumber == 0 ||
                                            fontNumber == null)
                                        ? null
                                        : font_family.elementAt(fontNumber)),
                              ),
                              subtitle: ((contact.phones.length > 0)
                                  ? Text(contact.phones.elementAt(0).value,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: (fontNumber == 0 ||
                                                  fontNumber == null)
                                              ? null
                                              : font_family
                                                  .elementAt(fontNumber)))
                                  : Text('')),
                              leading: CircleAvatar(
                                backgroundImage: (contact.avatar != null &&
                                        contact.avatar.length > 0)
                                    ? MemoryImage(contact.avatar)
                                    : AssetImage("assets/dummy5.png"),
                                backgroundColor: (contact.avatar != null &&
                                        contact.avatar.length > 0)
                                    ? null
                                    : Colors.lime[50],
                              ),
                              onTap: () {
                                String getdetail =
                                    (contact.displayName).toString();
                                print(getdetail);
                                Savefile.savecontactidetifier(getdetail);
                                Navigator.pushNamed(context, "/detail",
                                    arguments: {
                                      'Name': contact,
                                      'num': fontNumber,
                                    });
                              });
                        },
                        // controller: searchcontact,
                        // drawer: Drawer(child: Container()),
                      ),
                    ),
                  )
                : SpinKitChasingDots(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven ? Colors.black54 : Colors.black54,
                          shape: BoxShape.circle,
                        ),
                      );
                    },
                  ))
            : ((Contacts != null)
                ? Container(
                    color: (_image == null) ? Colors.black54 : null,
                    decoration: (_image != null)
                        ? BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(_image), fit: BoxFit.cover))
                        : null,
                    child: DraggableScrollbar.semicircle(
                        controller: _rrectController,
                        backgroundColor: Colors.blueGrey[800],
                        heightScrollThumb: 50,
                        scrollbarAnimationDuration: Duration(milliseconds: 200),
                        scrollbarTimeToFade: Duration(milliseconds: 900),
                        child: ListView.builder(
                          controller: _rrectController,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          itemCount: (check_contect == true)
                              ? filterdContacts.length
                              : Contacts.length,
                          itemBuilder: (context, index) {
                            Contact contact = (check_contect == true)
                                ? filterdContacts[index]
                                : Contacts[index];
                            return ListTile(
                                trailing: IconButton(
                                  iconSize: 35,
                                  onPressed: () async {
                                    var number = contact.phones
                                        .elementAt(0)
                                        .value; //set the number here
                                    await FlutterPhoneDirectCaller.callNumber(
                                        number);
                                  },
                                  icon: Icon(Icons.call),
                                  color: Colors.blue[600],
                                ),
                                title: (fontNumber == 0 || fontNumber == null)
                                    ? Text(contact.displayName,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 18.0,
                                        ))
                                    : Text(
                                        contact.displayName,
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18.0,
                                            fontFamily: font_family
                                                .elementAt(fontNumber)),
                                      ),
                                subtitle: (fontNumber == 0 ||
                                        fontNumber == null)
                                    ? ((contact.phones.length > 0)
                                        ? Text(
                                            contact.phones.elementAt(0).value,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                            ))
                                        : Text(''))
                                    : ((contact.phones.length > 0)
                                        ? Text(
                                            contact.phones.elementAt(0).value,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: font_family
                                                    .elementAt(fontNumber)),
                                          )
                                        : Text('')),
                                leading: ((contact.avatar != null &&
                                        contact.avatar.length > 0)
                                    ? CircleAvatar(
                                        backgroundImage:
                                            MemoryImage(contact.avatar),
                                      )
                                    : CircleAvatar(
                                        // child: Text(contact.initials()),
                                        backgroundImage:
                                            AssetImage("assets/dummy5.png"),
                                        backgroundColor: Colors.lime[50],
                                      )),
                                onTap: () {
                                  Navigator.pushNamed(context, "/detail",
                                      arguments: {
                                        'Name': contact,
                                        'num': fontNumber,
                                      });
                                  searchcontact.clear();
                                });
                          },
                        )
                        // drawer: Drawer(child: Container()),
                        ),
                  )
                : Container(
                    color: (_image == null) ? Colors.black54 : null,
                    decoration: (_image != null)
                        ? BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(_image), fit: BoxFit.cover))
                        : null,
                    child: SpinKitChasingDots(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color:
                                index.isEven ? Colors.white54 : Colors.white54,
                            shape: BoxShape.circle,
                          ),
                        );
                      },
                    ),
                  )));
  }
}
