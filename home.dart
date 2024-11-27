import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauthapp/pages/signin.dart';
import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {
  final User? user;

  const HomePage({Key? key, this.user}) : super(key: key);

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF98FB98),
              Color(0xFF66CDAA),
              Color.fromARGB(255, 60, 179, 113),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user?.email ?? "No Email Provided",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                //  primary: Colors.white, // Button color
                //  onPrimary: Colors.black, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Slightly rounded edges
                ),
                shadowColor: Colors.black,
                elevation: 10,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () => _logout(context),
              child: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
