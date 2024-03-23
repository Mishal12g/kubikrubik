import 'dart:async';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kubikrubik/helpers/date_formatters.dart';
import 'package:kubikrubik/models/catalog.dart';
import 'package:kubikrubik/models/enums/timer_stopwatch.dart';
import 'package:kubikrubik/services/catalogs_services.dart';

class TimerPageController extends GetxController {
  final CatalogService _catalogService = CatalogService();

  List<Catalog> _catalogs = [];
  Catalog? catalog;
  TimerStopwatch _timerOrStopwatch = TimerStopwatch.timer;
  String _timeResult = "00:00";
  int seconds = 0;
  bool isPlay = false;
  bool timerIsActive = false;
  late String selectedTime;

  String get timeResult => _timeResult;
  TimerStopwatch get timerOrStopwatch => _timerOrStopwatch;
  List<Catalog> get catalogs => _catalogs;

  late Timer _timer;

  final List<String> timeStrings = [
    "01:00",
    "02:00",
    "03:00",
    "04:00",
    "05:00",
    "06:00",
    "07:00",
    "08:00",
    "09:00",
    "10:00",
  ];

  TimerPageController() {
    loadCatalogs();
    selectTime(0);
  }

  setTimerOrStopwatch(TimerStopwatch timerStopwatch) {
    if (!isPlay) {
      switch (_timerOrStopwatch) {
        case TimerStopwatch.timer:
          _timerOrStopwatch = timerStopwatch;
        case TimerStopwatch.stopwatch:
          _timerOrStopwatch = timerStopwatch;
      }
      _timeResult = "00:00";
      update();
    }
  }

  loadCatalogs() {
    _catalogService.load();
    _catalogs = _catalogService.catalogs;
  }

  selectTime(index) {
    selectedTime = timeStrings[index];
    update();
  }

  void startTimer() {
    if (!timerIsActive) {
      _timeResult = "00:00";
      update();

      timerIsActive = !timerIsActive;
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          seconds = timer.tick;
          _timeResult = Formattes.formatDuration(timer.tick);
          update();
          if (timerOrStopwatch == TimerStopwatch.timer) {
            if (selectedTime == _timeResult) {
              isPlay = false;
              stopTimer();
            }
          }
        },
      );
    }
  }

  void stopTimer() {
    if (timerIsActive) {
      timerIsActive = !timerIsActive;
      _timer.cancel();
      isPlay = false;
      update();
    }
  }
}
