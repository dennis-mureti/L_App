import 'package:flutter/material.dart';
import 'package:lima_app/features/auth/services/login_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lima_app/features/home/screens/home_screen.dart';

enum Auth { login }

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Auth _auth = Auth.login;
  final _loginFormKey = GlobalKey<FormState>();
  bool obsecure = true;

  final LoginService loginService = LoginService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void loginUser() {
    loginService.loginUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  void setObsecure() {
    setState(() {
      obsecure = !obsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/farm.jpeg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        // if (_auth)
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          prefixIcon: Icon(FontAwesomeIcons.envelope)),
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(FontAwesomeIcons.lock),
                        // suffixIcon: IconButton(onPressed: () => setObsecure(), icon: icon)
                      ),
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your passwoord";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
