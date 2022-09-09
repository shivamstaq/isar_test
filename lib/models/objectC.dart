import 'package:isar/isar.dart';
import 'package:isar_test/locator.dart';

part 'objectC.g.dart';

@Collection()
class ObjectC {
  final Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  final String id;

  final String name;

  ObjectC({
    required this.id,
    required this.name,
  });

  @Ignore()
  Map<String, dynamic> get toJson => {
        'id': id,
        'name': name,
      };

  factory ObjectC.fromJson(Map<String, dynamic> json) {
    var r = ObjectC(
      id: json['id'],
      name: json['name'],
    );

    final isar = locator.get<Isar>();
    final collection = isar.collection<ObjectC>();

    isar.writeTxnSync(() {
      collection.putSync(
        r,
        saveLinks: true,
      );
    });

    return r;
  }
}
