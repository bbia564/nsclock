import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'clock_main_logic.dart';

class ClockMainPage extends StatefulWidget {
  const ClockMainPage({Key? key}) : super(key: key);

  @override
  State<ClockMainPage> createState() => _ClockMainPageState();
}

class _ClockMainPageState extends State<ClockMainPage> {
  final controller = Get.put(ClockMainLogic());

  void checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.toNamed('/error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkNetwork();
    super.initState();
  }

  Widget _item() {
    Widget item = Container();
    if (controller.type == 0) {
      item = <Widget>[
        <Widget>[
          Image.asset(
            'assets/icon0${controller.hourFirstNum}.webp',
            width: 128,
            height: 189,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 15,
          ),
          Image.asset(
            'assets/icon0${controller.hourLastNum}.webp',
            width: 128,
            height: 189,
            fit: BoxFit.cover,
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(
          height: 15,
        ),
        [
          Image.asset(
            'assets/icon0${controller.minuteFirstNum}.webp',
            width: 128,
            height: 189,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 15,
          ),
          Image.asset(
            'assets/icon0${controller.minuteLastNum}.webp',
            width: 128,
            height: 189,
            fit: BoxFit.cover,
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.center),
      ].toColumn();
    } else if (controller.type == 1) {
      item = <Widget>[
        <Widget>[
          Image.asset(
            'assets/icon1${controller.hourFirstNum}.webp',
            width: 147,
            height: 231,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 15,
          ),
          Image.asset(
            'assets/icon1${controller.hourLastNum}.webp',
            width: 147,
            height: 231,
            fit: BoxFit.cover,
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(
          height: 15,
        ),
        [
          Image.asset(
            'assets/icon1${controller.minuteFirstNum}.webp',
            width: 147,
            height: 231,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 15,
          ),
          Image.asset(
            'assets/icon1${controller.minuteLastNum}.webp',
            width: 147,
            height: 231,
            fit: BoxFit.cover,
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.center),
      ].toColumn();
    } else if (controller.type == 2) {
      item = <Widget>[
        Container(
          width: 302,
          height: 208,
          padding: const EdgeInsets.all(6),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: <Widget>[
              Image.asset(
                'assets/icon2${controller.hourFirstNum}.webp',
                width: 82,
                height: 115,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 15,
              ),
              Image.asset(
                'assets/icon2${controller.hourLastNum}.webp',
                width: 82,
                height: 115,
                fit: BoxFit.cover,
              )
            ].toRow(mainAxisAlignment: MainAxisAlignment.center),
          ).decorated(
              color: const Color(0xff161616),
              borderRadius: BorderRadius.circular(12)),
        ).decorated(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [Color(0xff313131), Color(0xff909090)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 302,
          height: 208,
          padding: const EdgeInsets.all(6),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: <Widget>[
              Image.asset(
                'assets/icon2${controller.minuteFirstNum}.webp',
                width: 82,
                height: 115,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 15,
              ),
              Image.asset(
                'assets/icon2${controller.minuteLastNum}.webp',
                width: 82,
                height: 115,
                fit: BoxFit.cover,
              )
            ].toRow(mainAxisAlignment: MainAxisAlignment.center),
          ).decorated(
              color: const Color(0xff161616),
              borderRadius: BorderRadius.circular(12)),
        ).decorated(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [Color(0xff313131), Color(0xff909090)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ].toColumn();
    }else if(controller.type == 3){
      item = <Widget>[
        Container(
          width: 352,
          height: 208,
          padding: const EdgeInsets.all(6),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: <Widget>[
              Image.asset(
                'assets/icon3${controller.hourFirstNum}.webp',
                width: 137,
                height: 195,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 25,
              ),
              Image.asset(
                'assets/icon3${controller.hourLastNum}.webp',
                width: 137,
                height: 195,
                fit: BoxFit.cover,
              )
            ].toRow(mainAxisAlignment: MainAxisAlignment.center),
          )
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 352,
          height: 208,
          padding: const EdgeInsets.all(6),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: <Widget>[
              Image.asset(
                'assets/icon3${controller.minuteFirstNum}.webp',
                width: 137,
                height: 195,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 25,
              ),
              Image.asset(
                'assets/icon3${controller.minuteLastNum}.webp',
                width: 137,
                height: 195,
                fit: BoxFit.cover,
              )
            ].toRow(mainAxisAlignment: MainAxisAlignment.center),
          )
        )
      ].toColumn();
    }
    return item;
  }

  Color buildColoredTextWithSwitch(int value) {
    Color textColor;
    switch (value) {
      case 0:
        textColor = const Color(0xfff7f6f9);
        break;
      case 1:
        textColor = Colors.black;
        break;
      case 2:
        textColor = Colors.black;
        break;
      case 3:
        textColor = const Color(0xFF43262E);
        break;
      default:
        textColor = const Color(0xfff7f6f9);
    }
    return textColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(title: const Text("Desktop clock")),
        body: GetBuilder<ClockMainLogic>(
            init: ClockMainLogic(),
            builder: (logic) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: SafeArea(
                    child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: <Widget>[
                    const SizedBox(height: 30),
                    _item(),
                    const SizedBox(height: 30),
                    <Widget>[
                      Image.asset(
                        'assets/image0.webp',
                        width: 57,
                        height: 57,
                        fit: BoxFit.cover,
                      ).gestures(onTap: () {
                        controller.about();
                      }),
                      const SizedBox(width: 15),
                      Image.asset(
                        'assets/image1.webp',
                        width: 57,
                        height: 57,
                        fit: BoxFit.cover,
                      ).gestures(onTap: () {
                        if (controller.type < 3) {
                          controller.type++;
                          controller.update();
                          controller.startTimer();
                        } else {
                          controller.type = 0;
                          controller.update();
                          controller.startTimer();
                        }
                      }),
                      const SizedBox(width: 15),
                      Image.asset(
                        'assets/image2.webp',
                        width: 57,
                        height: 57,
                        fit: BoxFit.cover,
                      ).gestures(onTap: () {
                        Get.toNamed('/setting');
                      }),
                    ].toRow(mainAxisAlignment: MainAxisAlignment.center)
                  ].toColumn(),
                )),
              ).decorated(
                  color: buildColoredTextWithSwitch(controller.type));
            }));
  }
}
