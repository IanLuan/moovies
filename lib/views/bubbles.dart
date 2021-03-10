import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bubbles extends StatefulWidget {

  @override
  _BubblesState createState() => _BubblesState();
}

class _BubblesState extends State<Bubbles> {
  static const platform = const MethodChannel('battery_plugin');

  String _batteryLevel = 'Unknown battery level.';
  String _isChargingText = "I don't know if is charging";

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    String isChargingText;

    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      final bool isCharging = await platform.invokeMethod('isCharging');
      isChargingText = isCharging ? "Está carregando" : "Não está carregando";
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

  
    setState(() {
      _batteryLevel = batteryLevel;
      _isChargingText = isChargingText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(_batteryLevel),
              Text(_isChargingText),
              ElevatedButton(
                child: Text('Get Battery Level'),
                onPressed: _getBatteryLevel,
              ),
            ],
          )
        )
      )
    );
  }
}