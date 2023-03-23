import 'package:flutter/material.dart';

class AddFarmerScreen extends StatefulWidget {
  static const String routeName = '/addfarmer';
  const AddFarmerScreen({Key? key}) : super(key: key);

  @override
  State<AddFarmerScreen> createState() => _AddFarmerScreenState();
}

class _AddFarmerScreenState extends State<AddFarmerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is the add farmer screen")),
    );
  }
}
