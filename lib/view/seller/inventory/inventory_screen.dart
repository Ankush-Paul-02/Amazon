import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 'Inventory'.text.make().centered(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: amber,
        shape: const CircleBorder(),
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: black,
        ),
      ),
    );
  }
}
