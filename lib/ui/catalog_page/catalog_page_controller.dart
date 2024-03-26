import 'dart:typed_data';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kubikrubik/models/catalog.dart';
import 'package:kubikrubik/services/catalogs_services.dart';

class CatalogPageController extends GetxController {
  Uint8List? image;

  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      image = await pickedFile.readAsBytes();
      update();
    } else {
      // ignore: avoid_print
      print('No image selected.');
    }
  }

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
    image = null;
  }

  editCatalog(Catalog catalog) {
    service.edit(catalog);
    loadCatalogs();
    image = null;
  }

  deleteCatalog(Catalog catalog) {
    service.delete(catalog);
    update();
  }
}
