import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Savefile {
  static Future<String> get getfilepath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get getfontfile async {
    final path = await getfilepath;
    return File('$path/fontfile.txt');
  }

  static Future<File> get getthemefile async {
    final path = await getfilepath;
    return File('$path/themefile.txt');
  }

  static Future<File> get getcontactidetifier async {
    final path = await getfilepath;
    return File('$path/contactidetifier.txt');
  }

  static Future<File> savefontfile(String data) async {
    final file = await getfontfile;
    return file.writeAsString(data);
  }

  static Future<File> savethemefile(String data) async {
    final file = await getthemefile;
    return file.writeAsString(data);
  }

  static Future<File> savecontactidetifier(String data) async {
    final file = await getcontactidetifier;
    return file.writeAsString(data);
  }

  static readfontfile() async {
    try {
      final file = await getfontfile;
      String content = file.readAsStringSync();
      return content;
    } catch (e) {
      return '0';
    }
  }

  static readcontactidetifier() async {
    try {
      final file = await getcontactidetifier;
      String content = file.readAsStringSync();
      return content;
    } catch (e) {
      return '0';
    }
  }

  static readthemefile() async {
    try {
      final file = await getthemefile;
      String content = file.readAsStringSync();
      return content;
    } catch (e) {
      return '0';
    }
  }
}
