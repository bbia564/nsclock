import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import '../events/events.dart';
import 'clock_setting_logic.dart';

class ClockSettingPage extends GetView<ClockSettingLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['24-hour system', 'About us'];
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        <Widget>[
          Visibility(
            visible: index == 0,
            child: Obx(() {
              return Switch(
                  value: controller.clockType.value,
                  onChanged: (v) async {
                    controller.clockType.value = v;
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('clockType', v);
                  });
            }),
          ),
          Visibility(
            visible: index != 0,
            child: const Icon(
              Icons.keyboard_arrow_right,
              size: 20,
              color: Colors.grey,
            ),
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.end)
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    )
        .decorated(color: Colors.white, borderRadius: BorderRadius.circular(12))
        .gestures(onTap: () {
      switch (index) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (result,b) {
        final emitter = GetIt.instance<Emitter>();
        emitter.emit(Events.setting, controller.clockType.value);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Setting")),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: <Widget>[
                  const Text('24-hour system'),
                  Obx(() {
                    return Switch(
                        activeTrackColor: Colors.green,
                        value: controller.clockType.value,
                        onChanged: (v) async {
                          controller.clockType.value = v;
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('clockType', v);
                        });
                  })
                ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              const SizedBox(
                height: 15,
              ),
              Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      child: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          height: 30,
                          child: <Widget>[
                            const Text('About us'),
                            const Text("1.0.0").paddingOnly(right: 12)
                          ].toRow(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween),
                        ).decorated(color: Colors.transparent)
                      ].toColumn(
                          separator: Divider(
                        height: 15,
                        color: Colors.grey[300],
                      )))
                  .decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
            ].toColumn(),
          ).marginAll(15)),
        ),
      ),
    );
  }
}
