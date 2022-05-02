import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:procontact/res/theme.dart';
import 'package:provider/provider.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:procontact/res/files.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var count;
  Contact user;
  String name;
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
    super.initState();
    // TODO: implement initState
    getfont();
    Get_detail();
  }

  getfont() async {
    String strfontNumber = await Savefile.readfontfile();
    setState(() {
      fontNumber = int.parse(strfontNumber);
    });
  }

  Get_detail() async {
    String _identifier = await Savefile.readcontactidetifier();
    if (_identifier != null || _identifier != '') {
      // count = (await ContactsService.getContacts(query: _identifier)).toList();
      setState(() {
        user = count;
      });
    } else {
      count = (await ContactsService.getContacts()).toList();
      setState(() {
        user = data['Name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    ThemeChanger _themechanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
        appBar: AppBar(
          title: (fontNumber == 0 || fontNumber == null)
              ? Text("Detail")
              : Text(
                  'Detail',
                  style:
                      TextStyle(fontFamily: font_family.elementAt(fontNumber)),
                ),
          actions: [
            PopupMenuButton(
              onSelected: (_) {},
              itemBuilder: (context) {
                return;
              },
            )
          ],
          backgroundColor: Colors.teal,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/edit',
                arguments: {'data': user, 'font': fontNumber});
          },
          child: Icon(Icons.edit),
          backgroundColor: Colors.teal,
        ),
        body: (_themechanger.getTheme() == ThemeData.light())
            ? Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 15.0),
                child: ((user != null)
                    ? SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CircleAvatar(
                                backgroundImage: ((user.avatar.length > 0 &&
                                        user.avatar != null)
                                    ? MemoryImage(user.avatar)
                                    : AssetImage("assets/dummy5.png")),
                                backgroundColor: Colors.lime[50],
                                radius: 80.0,
                              ),
                            ),
                            SizedBox(
                              height: 60.0,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.black26,
                              thickness: 1,
                            ),
                            _build_label_text('Name'),
                            _build_main_label(
                                user.displayName,
                                Icon(Icons.account_circle_rounded,
                                    color: Colors.blue[900])),
                            (user.phones.length > 0)
                                ? Divider(
                                    height: 1.0,
                                    color: Colors.black26,
                                    thickness: 1,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.phones.length > 0)
                                ? _build_label_text('Number')
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.phones.length > 0)
                                ? _build_main_label(
                                    user.phones.elementAt(0).value,
                                    Icon(Icons.phone, color: Colors.blue[900]))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.phones.length > 1)
                                ? _build_main_label(
                                    user.phones.elementAt(1).value,
                                    Icon(Icons.phone, color: Colors.blue[900]))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.phones.length > 2)
                                ? _build_main_label(
                                    user.phones.elementAt(2).value,
                                    Icon(Icons.phone, color: Colors.blue[900]))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.emails.length > 0)
                                ? Divider(
                                    height: 1.0,
                                    color: Colors.black26,
                                    thickness: 1,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.emails.length > 0)
                                ? _build_label_text('Email')
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.emails.length > 0)
                                ? _build_main_label(
                                    user.emails.elementAt(0).value,
                                    Icon(Icons.mail_outlined,
                                        color: Colors.blue[900]))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.emails.length > 1)
                                ? _build_main_label(
                                    user.emails.elementAt(1).value,
                                    Icon(Icons.mail_outlined,
                                        color: Colors.blue[900]))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.jobTitle != null)
                                ? Divider(
                                    height: 1.0,
                                    color: Colors.black26,
                                    thickness: 1,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.jobTitle != null)
                                ? _build_label_text('Occupation')
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.jobTitle != null)
                                ? _build_main_label(user.jobTitle,
                                    Icon(Icons.work, color: Colors.blue[900]))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.postalAddresses.length > 0)
                                ? Divider(
                                    height: 1.0,
                                    color: Colors.black26,
                                    thickness: 1,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.postalAddresses.length > 0)
                                ? _build_label_text('Current Address')
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.postalAddresses.length > 0)
                                ? _build_main_label(
                                    user.postalAddresses
                                        .elementAt(0)
                                        .toString(),
                                    Icon(Icons.location_pin,
                                        color: Colors.blue[900]))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.postalAddresses.length > 1)
                                ? Divider(
                                    height: 1.0,
                                    color: Colors.black26,
                                    thickness: 1,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.postalAddresses.length > 1)
                                ? _build_label_text('Permanent Address')
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.postalAddresses.length > 1)
                                ? _build_main_label(
                                    user.postalAddresses
                                        .elementAt(0)
                                        .toString(),
                                    Icon(Icons.location_pin,
                                        color: Colors.blue[900]))
                                : SizedBox(
                                    height: 0,
                                  ),
                            Divider(
                              height: 1.0,
                              color: Colors.black26,
                              thickness: 1,
                            )
                          ],
                        ),
                      )
                    : SpinKitChasingDots(
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: index.isEven
                                  ? Colors.black54
                                  : Colors.black54,
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      )))
            : Container(
                color: Colors.black54,
                width: 500,
                padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 15.0),
                height: 1500,
                child: ((user != null)
                    ? SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CircleAvatar(
                                backgroundImage: ((user.avatar != null &&
                                        user.avatar.length > 0)
                                    ? MemoryImage(user.avatar)
                                    : AssetImage("assets/dummy5.png")),
                                backgroundColor: Colors.white,
                                radius: 80.0,
                              ),
                            ),
                            SizedBox(
                              height: 60.0,
                            ),
                            Divider(
                              height: 1,
                            ),
                            _build_label_dark('Name'),
                            _build_main_dark(
                                user.displayName,
                                Icon(
                                  Icons.account_circle,
                                  color: Colors.blueGrey[700],
                                )),
                            (user.phones.length > 0)
                                ? Divider(
                                    height: 1.0,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.phones.length > 0)
                                ? _build_label_dark((user.phones.length > 1)
                                    ? 'Numbers'
                                    : 'Number')
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.phones.length > 0)
                                ? _build_main_dark(
                                    user.phones.elementAt(0).value,
                                    Icon(
                                      Icons.phone,
                                      color: Colors.blueGrey[700],
                                    ))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.phones.length > 1)
                                ? _build_main_dark(
                                    user.phones.elementAt(1).value,
                                    Icon(
                                      Icons.phone,
                                      color: Colors.blueGrey[700],
                                    ))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.phones.length > 2)
                                ? _build_main_dark(
                                    user.phones.elementAt(2).value,
                                    Icon(
                                      Icons.phone,
                                      color: Colors.blueGrey[700],
                                    ))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.emails.length > 0)
                                ? Divider(
                                    height: 1.0,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.emails.length > 0)
                                ? _build_label_dark((user.emails.length > 1)
                                    ? 'Emails'
                                    : 'Email')
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.emails.length > 0)
                                ? _build_main_dark(
                                    user.emails.elementAt(0).value,
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.blueGrey[700],
                                    ))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.emails.length > 1)
                                ? Divider(
                                    height: 1.0,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.emails.length > 1)
                                ? _build_main_dark(
                                    user.emails.elementAt(1).value,
                                    Icon(
                                      Icons.mail_outlined,
                                      color: Colors.blueGrey[700],
                                    ))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.jobTitle != null)
                                ? Divider(
                                    height: 1.0,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.jobTitle != null)
                                ? _build_label_dark('Occupation')
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.jobTitle != null)
                                ? _build_main_dark(
                                    user.jobTitle,
                                    Icon(
                                      Icons.work,
                                      color: Colors.blueGrey[700],
                                    ))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.postalAddresses.length > 0)
                                ? Divider(
                                    height: 1.0,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.postalAddresses.length > 0)
                                ? _build_label_dark('Current Address')
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.postalAddresses.length > 0)
                                ? _build_main_dark(
                                    user.postalAddresses
                                        .elementAt(0)
                                        .toString(),
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.blueGrey[700],
                                    ))
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.postalAddresses.length > 1)
                                ? _build_label_dark('Permanent Addrress')
                                : SizedBox(
                                    height: 0,
                                  ),
                            (user.postalAddresses.length > 1)
                                ? _build_main_dark(
                                    user.postalAddresses
                                        .elementAt(1)
                                        .toString(),
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.blueGrey[700],
                                    ))
                                : SizedBox(
                                    height: 0,
                                  ),
                            Divider(
                              height: 1.0,
                            )
                          ],
                        ),
                      )
                    : SpinKitChasingDots(
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: index.isEven
                                  ? Colors.white70
                                  : Colors.white70,
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      )),
              ));
  }

  Widget _build_main_dark(String text, Icon iconName) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
            fontSize: (fontNumber == 0 || fontNumber == null) ? 20 : 22,
            color: Colors.white70,
            fontFamily: (fontNumber == 0 || fontNumber == null)
                ? null
                : font_family.elementAt(fontNumber)),
      ),
      leading: iconName,
      onTap: () async {
        try {
          await FlutterPhoneDirectCaller.callNumber(text);
        } catch (e) {}
      },
    );
  }

  Widget _build_label_dark(String label) {
    return Text(
      label,
      style: TextStyle(
          fontSize: (fontNumber == 0 || fontNumber == null) ? 16.0 : 18.0,
          color: Colors.blueGrey[400],
          fontFamily: font_family.elementAt(fontNumber),
          letterSpacing: (fontNumber == 0 || fontNumber == null) ? null : 2),
    );
  }

  Widget _build_label_text(String label) {
    return Text(
      label,
      style: TextStyle(
          fontSize: (fontNumber == 0 || fontNumber == null) ? 16.0 : 18.0,
          color: Colors.blue[500],
          fontFamily: (fontNumber == 0 || fontNumber == null)
              ? null
              : font_family.elementAt(fontNumber),
          letterSpacing: (fontNumber == 0 || fontNumber == null) ? null : 2),
    );
  }

  Widget _build_main_label(String text, Icon iconName) {
    return ListTile(
        title: Text(
          text,
          style: TextStyle(
            fontSize: (fontNumber == 0 || fontNumber == null) ? 20.0 : 22.0,
            color: Colors.black,
            fontFamily: (fontNumber == 0 || fontNumber == null)
                ? null
                : font_family.elementAt(fontNumber),
          ),
        ),
        leading: iconName,
        onTap: () async {
          if (text == user.phones.elementAt(0).value ||
              text == user.phones.elementAt(1).value ||
              text == user.phones.elementAt(2).value) {
            await FlutterPhoneDirectCaller.callNumber(text);
          }
        });
  }
}
