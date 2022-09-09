import 'package:isar/isar.dart';
import 'package:isar_test/locator.dart';
import 'package:isar_test/models/objectC.dart';

part 'objectB.g.dart';

@Collection()
class ObjectB {
  final Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  final String id;

  final String name;

  final cLink = IsarLink<ObjectC>();

  ObjectB({
    required this.id,
    required this.name,
  });

  @Ignore()
  Map<String, dynamic> get toJson => {
        'id': id,
        'name': name,
        'cLink': cLink.value?.toJson,
      };

  factory ObjectB.fromJson(Map<String, dynamic> json) {
    var r = ObjectB(
      id: json['id'],
      name: json['name'],
    );

    r.cLink.value = ObjectC.fromJson(json['cLink']);

    final isar = locator.get<Isar>();
    final collection = isar.collection<ObjectB>();

    isar.writeTxnSync(() {
      collection.putSync(
        r,
        saveLinks: true,
      );
    });

    return r;
  }
}
