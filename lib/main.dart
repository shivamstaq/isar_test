import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:isar_test/locator.dart';
import 'package:isar_test/models/objectA.dart';
import 'package:isar_test/models/objectB.dart';
import 'package:isar_test/models/objectC.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLocator();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Isar isar = locator.get<Isar>();

  @override
  void initState() {
    super.initState();

    initDB();
  }

  void initDB() {
    //Create Objects

    Map<String, dynamic> json = {
      'id': 'id1',
      'name': "simon",
      'bLink': {
        'id': 'id2',
        'name': 'bob',
        'cLink': {
          'id': 'id3',
          'name': 'ted',
        }
      },
    };

    ObjectA aObj = ObjectA.fromJson(json);

    log(aObj.toJson.toString());

    var a = isar.collection<ObjectA>().getByIdSync('id1');
    a!.bLink.loadSync();
    a.bLink.value!.cLink.loadSync();

    log(a.toJson.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello"),
        ),
      ),
    );
  }
}
