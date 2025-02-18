import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../events/events.dart';

class ClockMainLogic extends GetxController {
  int type = 0;
  int hourFirstNum = 0;
  int hourLastNum = 0;
  int minuteFirstNum = 0;
  int minuteLastNum = 0;

  Timer? _timer;

  void startTimer() async {
    stopTimer();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final clockType = prefs.getBool('clockType') ?? true;
    final now = DateTime.now();
    final nowStr = DateFormat('HH:mm').format(now);
    final nowHourNum = int.parse(nowStr.substring(0, 2));
    final nowMinuteFirstNum = int.parse(nowStr.substring(3, 4));
    final nowMinuteLastNum = int.parse(nowStr.substring(4, 5));
    minuteFirstNum = nowMinuteFirstNum;
    minuteLastNum = nowMinuteLastNum;
    if (clockType) {
      hourFirstNum = int.parse(nowStr.substring(0, 1));
      hourLastNum = int.parse(nowStr.substring(1, 2));
    } else {
      if (nowHourNum > 12) {
        var hereStr = (nowHourNum - 12).toString();
        if (hereStr.length == 1) {
          hereStr = '0$hereStr';
        }
        hourFirstNum = int.parse(hereStr.substring(0, 1));
        hourLastNum = int.parse(hereStr.substring(1, 2));
      } else {
        hourFirstNum = int.parse(nowStr.substring(0, 1));
        hourLastNum = int.parse(nowStr.substring(1, 2));
      }

    }
    update();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final nowStr = DateFormat('HH:mm').format(now);
      final nowHourNum = int.parse(nowStr.substring(0, 2));
      final nowMinuteFirstNum = int.parse(nowStr.substring(3, 4));
      final nowMinuteLastNum = int.parse(nowStr.substring(4, 5));
      minuteFirstNum = nowMinuteFirstNum;
      minuteLastNum = nowMinuteLastNum;
      if (clockType) {
        hourFirstNum = int.parse(nowStr.substring(0, 1));
        hourLastNum = int.parse(nowStr.substring(1, 2));
      } else {
        if (nowHourNum > 12) {
          var hereStr = (nowHourNum - 12).toString();
          if (hereStr.length == 1) {
            hereStr = '0$hereStr';
          }
          hourFirstNum = int.parse(hereStr.substring(0, 1));
          hourLastNum = int.parse(hereStr.substring(1, 2));
        } else {
          hourFirstNum = int.parse(nowStr.substring(0, 1));
          hourLastNum = int.parse(nowStr.substring(1, 2));
        }
      }
      update();
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  about() async {
    Get.dialog(AlertDialog(
      title: const Text(
        'Instructions for use',
        textAlign: TextAlign.center,
      ),
      content: const Text(
        'You can change the clock style and whether it is 24 hours',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    final emitter = GetIt.instance<Emitter>();
    emitter.on(Events.setting, (_) {
      startTimer();
    });
    super.onInit();
  }
}
