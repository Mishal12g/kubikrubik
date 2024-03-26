import 'package:hive_flutter/hive_flutter.dart';
import 'package:kubikrubik/models/catalog.dart';
import 'package:kubikrubik/models/record_catalog.dart';

class HiveInitialization {
  static Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(CatalogAdapter());
    Hive.registerAdapter(RecordCatalogAdapter());

    await Hive.openBox<List>("Catalogs");
    await Hive.openBox<List>("Records");
    await Hive.openBox<bool>("Onboarding");
  }
}
