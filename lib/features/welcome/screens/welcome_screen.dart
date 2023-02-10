import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Image(
                  image: AssetImage("assets/images/lima_logo.png"),
                )
              ],
            ),
          ),
          // Expanded(
          //     child: Column(
          //   children: [Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(image: AssetImage(''))
          //     ),
          //   )],
          // ))
        ],
      ),
    );
  }
}
