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

  delete(Catalog catalog) async {
    final index = _catalogs.indexWhere((element) {
      return element.id == catalog.id;
    });

    _catalogs.removeAt(index);
    await box.put(_listCatalogs, _catalogs);
  }

  edit(Catalog catalog) async {
    final index = _catalogs.indexWhere((element) {
      return element.id == catalog.id;
    });

    _catalogs[index] = catalog;
    await box.put(_listCatalogs, _catalogs);
  }
}
