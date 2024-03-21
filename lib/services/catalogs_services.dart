import 'package:hive/hive.dart';
import 'package:kubikrubik/models/catalog.dart';

class CatalogService {
  final _listCatalogs = "CatalogsList";

  late Box<List> box;
  List<Catalog> _catalogs = [];
  List<Catalog> get catalogs => _catalogs;

  load() {
    box = Hive.box<List>("Catalogs");
    _catalogs = box.get(_listCatalogs)?.map((e) => e as Catalog).toList() ?? [];
  }

  add(Catalog catalog) async {
    _catalogs.add(catalog);
    await box.put(_listCatalogs, _catalogs);
  }

  delete(int index) async {
    _catalogs.removeAt(index);
    await box.put(_listCatalogs, _catalogs);
  }
}
