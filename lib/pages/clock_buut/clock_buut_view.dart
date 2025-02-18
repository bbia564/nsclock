import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'clock_buut_logic.dart';

class ClockBuutView extends GetView<PageLogic> {
  const ClockBuutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.boyle.value
              ? const CircularProgressIndicator(color: Colors.black)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.tgskbdqz();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
