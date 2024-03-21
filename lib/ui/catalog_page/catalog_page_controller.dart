import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/models/catalog.dart';
import 'package:kubikrubik/services/catalogs_services.dart';

class CatalogPageController extends GetxController {
  final CatalogService service = CatalogService();

  List<Catalog> _catalogs = [];
  List<Catalog> get catalogs => _catalogs;

  CatalogPageController() {
    loadCatalogs();
  }

  loadCatalogs() {
    service.load();
    _catalogs = service.catalogs;
    update();
  }

  addCatalog(Catalog catalog) {
    service.add(catalog);
    loadCatalogs();
  }

  deleteCatalog(int index) {
    service.delete(index);
    update();
  }
}
