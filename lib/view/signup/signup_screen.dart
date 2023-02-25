import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //att
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final FirstName = FirstNameController.text;
    final LastName = LastNameController.text;
    final Email = EmailController.text;
    final Password = PasswordController.text;
    final url = Uri.parse('http://localhost:9090/user/register');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'FirstName': FirstName,
            'LastName': LastName,
            'Email': Email,
            'Password': Password,
          },
        ),
        headers: {'Content-Type': 'application/json'},
      );
      final responseData = json.decode(response.body);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User already exists')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFFFFFFF),
        appBar :
        AppBar(
          iconTheme: const IconThemeData(color: Color(0xFFBC539F)),
          title: const Text("Sign up"),
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
            SizedBox(height: 30),
            const Text(
              "Create your account",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            const Text(
              "Please enter your informations",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF868686),
              ),
            ),
            SizedBox(height: 40),
            Form(
              //padding: const EdgeInsets.symmetric(horizontal: 20),
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'First name',
                    style: TextStyle(
                      color: Color(0xFF8A8585),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: FirstNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'John',
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
                  SizedBox(height: 15),
                  const Text(
                    'Last name',
                    style: TextStyle(
                      color: Color(0xFF8A8585),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: LastNameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'Doe',
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: Color(0xFF8A8585),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: EmailController,
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
                  ),
                  SizedBox(height: 15),
                  const Text(
                    'Passowrd',
                    style: TextStyle(
                      color: Color(0xFF8A8585),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: PasswordController,
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
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter a password";
                      } else if (value.length < 8) {
                        return "The password must not be less than 8 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 65),
                  SizedBox(
                    height: 53,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _submitForm();
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
                        "Sign up",
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
