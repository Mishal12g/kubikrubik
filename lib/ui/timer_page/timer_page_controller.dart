import 'dart:async';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/models/catalog.dart';
import 'package:kubikrubik/services/catalogs_services.dart';

class TimerPageController extends GetxController {
  final CatalogService _catalogService = CatalogService();
  late Timer _timer;

  List<Catalog> _catalogs = [];

  String _timeResult = "00:00";
  bool isPlay = false;
  bool timerIsActive = false;

  String get timeResult => _timeResult;
  List<Catalog> get catalogs => _catalogs;

  TimerPageController() {
    loadCatalogs();
  }

  loadCatalogs() {
    _catalogService.load();
    _catalogs = _catalogService.catalogs;
  }

  String _formatDuration(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds ~/ 60) % 60;
    int remainingSeconds = seconds % 60;

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    }
  }

  void startTimer() {
    if (!timerIsActive) {
      _timeResult = "00:00";
      update();

      timerIsActive = !timerIsActive;
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          _timeResult = _formatDuration(timer.tick);
          update();
        },
      );
    }
  }

  void stopTimer() {
    if (timerIsActive) {
      timerIsActive = !timerIsActive;
      _timer.cancel();
      update();
    }
  }
}
