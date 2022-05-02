import 'package:flutter/material.dart';
import 'package:procontact/res/files.dart';
import 'package:procontact/res/theme.dart';
import 'package:provider/provider.dart';

class Note extends StatefulWidget {
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  bool change = false;
  String change_string;
  Map data = {};
  int fontNumber = 0;
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
    getthemedata();
    getfont();
    gettheme();
    // TODO: implement initState
    super.initState();
  }

  getthemedata() async {
    String _gettheme = await Savefile.readthemefile();
    if (_gettheme == 'true') {
      setState(() {
        change = true;
      });
    } else if (_gettheme == 'false') {
      setState(() {
        change = false;
      });
    } else {
      setState(() {
        change = false;
      });
    }
  }

  getfont() async {
    String strfontNumber = await Savefile.readfontfile();
    setState(() {
      fontNumber = int.parse(strfontNumber);
    });
    setState(() {
      fontNumber = data['font'];
    });
  }

  gettheme() async {
    ThemeChanger _themechanger = Provider.of<ThemeChanger>(context);
    setState(() {
      if (change == false) {
        _themechanger.setTheme(ThemeData.light());
      } else {
        _themechanger.setTheme(ThemeData.dark());
      }
    });
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (searchnote == null || searchnote.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            searchnote.clear();
          },
        ),
      ];
    }

    return <Widget>[
      new IconButton(
        icon: const Icon(
          Icons.youtube_searched_for,
          size: 30,
        ),
        onPressed: _startSearch,
      ),
    ];
  }

  bool _isSearching = false;
  TextEditingController searchnote = TextEditingController();

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    searchnote.clear();

    setState(() {
      _isSearching = false;
    });
  }

  Widget _buildSearchField() {
    return new TextField(
      controller: searchnote,
      autofocus: true,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: isNote(),
    );
  }

  isNote() {}

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    ThemeChanger _themechanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: (_isSearching)
            ? _buildSearchField()
            : ((fontNumber == 0 || fontNumber == null)
                ? Text("Notes")
                : Text(
                    'Notes',
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
          Icons.note_add_rounded,
          color: Colors.white,
          size: 32,
        ),
        onPressed: () {},
        backgroundColor: Colors.brown,
      ),
      drawer: Drawer(
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
                onTap: () async {
                  Navigator.pushReplacementNamed(context, '/home',
                      arguments: {'font': fontNumber});
                }),
            ListTile(
                title: (fontNumber == 0 || fontNumber == null)
                    ? Text('Notes',
                        style: TextStyle(
                          // fontFamily: font_family.elementAt(0),
                          fontSize: 18.0,
                        ))
                    : Text(
                        "Notess",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: font_family.elementAt(fontNumber)),
                      ),
                leading: Icon(
                  Icons.notes,
                  color: Colors.blue[800],
                ),
                onTap: () {
                  Navigator.pop(context);
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
                                fontFamily: font_family.elementAt(fontNumber)),
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
                                fontFamily: font_family.elementAt(fontNumber)),
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
            SizedBox(
              height: 280,
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
      body: Container(
        color: (_themechanger.getTheme() == ThemeData.dark())
            ? Colors.black54
            : null,
      ),
    );
  }
}
