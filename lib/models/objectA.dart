import 'package:isar/isar.dart';
import 'package:isar_test/locator.dart';
import 'package:isar_test/models/objectB.dart';
import 'package:isar_test/models/objectC.dart';

part 'objectA.g.dart';

@Collection()
class ObjectA {
  final Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  final String id;

  final String name;

  final bLink = IsarLink<ObjectB>();
  // final bLinks = IsarLinks<ObjectB>();
  // final cLinks = IsarLinks<ObjectC>();

  ObjectA({required this.id, required this.name});

  @Ignore()
  Map<String, dynamic> get toJson => {
        'id': id,
        'name': name,
        'bLink': bLink.value?.toJson,
      };

  factory ObjectA.fromJson(Map<String, dynamic> json) {
    var r = ObjectA(
      id: json['id'],
      name: json['name'],
    );

    r.bLink.value = ObjectB.fromJson(json['bLink']);

    final isar = locator.get<Isar>();
    final collection = isar.collection<ObjectA>();

    isar.writeTxnSync(() {
      collection.putSync(
        r,
        saveLinks: true,
      );
    });

    return r;
  }
}
