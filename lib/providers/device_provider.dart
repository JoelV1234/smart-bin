import 'package:flutter/material.dart';

class DeviceProvider extends ChangeNotifier {
  double remainingHeight;
  double? batteryPercentage;
  double garbageBinHeight;

  double fullPercentage() {
    return (garbageBinHeight - remainingHeight) / garbageBinHeight;
  }

  DeviceProvider(
      {this.remainingHeight = 0,
      this.batteryPercentage = 0,
      this.garbageBinHeight = 0});
}
