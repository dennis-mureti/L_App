import 'package:flutter/material.dart';
import 'package:lima_app/features/auth/screens/login_screen.dart';
import 'package:lima_app/features/auth/screens/register_screen.dart';

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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Image(
                      image: AssetImage("assets/images/lima_logo.png"),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(top: 25, left: 24, right: 24),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/farm.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 70.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(500, 50),
                                    backgroundColor: Colors.green[500],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(RegisterScreen.routeName),
                                child: const Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16), // login
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(500, 50),
                                    backgroundColor: Colors.green[500],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(LoginScreen.routeName),
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 60.0,
                      height: 48.0,
                      decoration: const BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/mhealogo.jpeg"),
                        ),
                      ),
                    ),
                    Container(
                      width: 60.0,
                      height: 48.0,
                      decoration: const BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/icipe.png"),
                        ),
                      ),
                    ),
                    Container(
                      width: 60.0,
                      height: 48.0,
                      decoration: const BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/eu.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
