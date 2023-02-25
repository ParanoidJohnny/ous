import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weparent/view/welcome/welcome_screen.dart';
import 'package:weparent/view/welcome/welcome_screen.dart';

import '../ResetPassword/enteremail_screen.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final Email = _emailController.text.trim();
    final Password = _passwordController.text;

    final response = await http.post(
      Uri.parse('http://localhost:9090/user/login'),
      body: {
        'Email': Email,
        'Password': Password,
      },
    );

    if (response.statusCode == 200) {
      // Login successful, navigate to home screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    } else {
      // Login failed, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFBC539F)),
        title: const Text("Login"),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        titleSpacing: 0.0,
        foregroundColor: const Color(0xFFBC539F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              "Welcome back !",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Please enter your informations",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF868686),
              ),
            ),
            SizedBox(height: 80),
            Form(
              //padding: const EdgeInsets.symmetric(horizontal: 20),
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: Color(0xFF8A8585),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      //regex
                      RegExp regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      } else if (!regex.hasMatch(value)) {
                        return "Invalid Email!";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'example@domain.com',
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFBC539F), width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF8A8585)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Passowrd',
                    style: TextStyle(
                      color: Color(0xFF8A8585),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: '********',
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFBC539F), width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF8A8585)),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                            "/email");
                      },
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          color: Color(0xFFBC539F),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 90),
                  SizedBox(

                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                            "/login");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFBC539F)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: const <Widget>[
                      Expanded(
                        child: Divider(
                          color: Color(0xFFBC539F),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(
                            color: Color(0xFFBC539F),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xFFBC539F),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'Assets/facebook.png',
                          height: 70,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'Assets/google.png',
                          height: 70,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'Assets/apple.png',
                          height: 70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
