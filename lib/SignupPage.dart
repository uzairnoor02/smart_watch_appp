import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

import 'Component/Components.dart';
import 'HomePage.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff192442),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginPageInputField(
              prefix: Icons.email_outlined,
              hintText: 'Type Email',
              labelText: 'Email',
              emailController: _emailController,
              hideText: false,
            ),
            const SizedBox(height: 30),
            LoginPageInputField(
              prefix: Icons.password,
              hintText: 'Chose Password',
              labelText: 'Password',
              emailController: _passwordController,
              hideText: true,
            ),
            const SizedBox(height: 80),
            BouncingWidget(
              onPressed: () {
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff525355),
                ),
                child: const Center(
                    child: Text(
                  "SIGNUP",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
