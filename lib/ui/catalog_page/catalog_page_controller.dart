import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/resources/resources.dart';

class CatalogPageController extends GetxController {
  final List<Catalog> _catalogs = [
    Catalog(
      name: "name",
      size: "size",
      comment: "comment",
      photo: AppImages.cube2,
    )
  ];
  List<Catalog> get catalogs => _catalogs;

  addCatalog(Catalog catalog) {
    _catalogs.add(catalog);
    update();
  }
}

class Catalog {
  final String name;
  final String size;
  final String? comment;
  final String? photo;

  Catalog({
    required this.name,
    required this.size,
    required this.comment,
    required this.photo,
  });
}
