import 'package:Angel/Screens/homepage/HomePage.dart';
import 'package:Angel/Screens/main_pages/admin.dart';
import 'package:Angel/intro/IntroSlider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (FirebaseAuth.instance.currentUser!.uid ==
                'qTQ53sw0qzcsbBvAauKIYvIzu1Y2') {
              return const AdminPage();
            }
            return const HomeScreenBody();
          } else {
            return const IntroSlider();
          }
        },
      ),
    );
  }
}
