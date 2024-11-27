import 'package:firebaseauthapp/pages/signin.dart';
import 'package:firebaseauthapp/services/auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final AuthService _authService = AuthService();

  void signup() async {
    if (_formKey.currentState!.validate()) {
      try {
        if (passwordController.text.trim() ==
            confirmPasswordController.text.trim()) {
          await _authService.signUp(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signup Successful!')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Passwords do not match')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up Page',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      //  backgroundColor: Colors.black38,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 152, 251, 152),
              Color.fromARGB(255, 102, 205, 170),
              Color.fromARGB(255, 60, 179, 113),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your email' : null,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your password' : null,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Confirm your password' : null,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.white, // Button color
                      // onPrimary: Colors.black, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // No rounded corners
                      ),
                      shadowColor: Colors.black, // Shadow color
                      elevation: 10.0, // Depth effect
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15), // Size of the button
                    ),
                    onPressed: signup,
                    child: const Text('Sign Up'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Already have an account? Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
