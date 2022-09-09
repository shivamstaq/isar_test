//? Test for addAll not working
// class MyApp extends StatefulWidget {
//   final Isar isar;

//   const MyApp({required this.isar, super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();

//     initDB();
//   }

//   void initDB() {
//     //Create Objects
//     Parent parentObj = Parent();
//     ObjectA aObj = ObjectA(name: "aName1");
//     aObj.bLink.value = ObjectB(name: "bName1");
//     aObj.bLinks.addAll([
//       ObjectB(name: "bName2"),
//       ObjectB(name: "bName3"),
//     ]);
//     aObj.cLinks.addAll([
//       ObjectC(name: "cName1"),
//       ObjectC(name: "cName2"),
//     ]);

//     parentObj.aLink.value = aObj;
//     late int parentId;
//     widget.isar.writeTxnSync(() {
//       parentId =
//           widget.isar.collection<Parent>().putSync(parentObj, saveLinks: true);
//     });

//     log("initDB Output: ");
//     log(parentObj.aLink.value!.bLink.value!.name);
//     log(parentObj.aLink.value!.bLinks.map((e) => e.name).toList().toString());
//     log(parentObj.aLink.value!.cLinks.map((e) => e.name).toList().toString());

//     testValues(parentId);
//   }

//   void testValues(Id id) {
//     // fetch parentObj
//     var parentObj = widget.isar.collection<Parent>().getSync(id);
//     parentObj!.aLink.loadSync();
//     parentObj.aLink.value!.bLink.loadSync();
//     parentObj.aLink.value!.bLinks.loadSync();
//     parentObj.aLink.value!.cLinks.loadSync();

//     log("testValues Output: ");
//     log(parentObj.aLink.value!.bLink.value!.name);
//     log(parentObj.aLink.value!.bLinks.map((e) => e.name).toList().toString());
//     log(parentObj.aLink.value!.cLinks.map((e) => e.name).toList().toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text("Hello"),
//         ),
//       ),
//     );
//   }
// }
