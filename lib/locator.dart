import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:isar_test/models/objectA.dart';
import 'package:isar_test/models/objectB.dart';
import 'package:isar_test/models/objectC.dart';
import 'package:path_provider/path_provider.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  final dir = await getApplicationSupportDirectory();
  final isar = await Isar.open(
    [
      ObjectASchema,
      ObjectBSchema,
      ObjectCSchema,
    ],
    directory: dir.path,
    inspector: true,
  );

  // await isar.writeTxn(() async {
  //   await isar.clear();
  // });

  locator.registerSingleton<Isar>(isar);
}
