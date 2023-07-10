import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MonitorScreen extends StatefulWidget {
  const MonitorScreen({super.key});

  @override
  State<MonitorScreen> createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 'Monitor'.text.make().centered(),
    );
  }
}