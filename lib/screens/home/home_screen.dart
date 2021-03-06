import 'package:firebase_auth_test/providers/user_provider.dart';
import 'package:firebase_auth_test/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return context.watch<UserProvider>().getCurrentUser == null
        ? const LoginScreen()
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.read<UserProvider>().getCurrentUser!.email!),
                  const SizedBox(height: 24),
                  ElevatedButton(
                      onPressed: () async {
                        context.read<UserProvider>().logoutUser();
                      },
                      child: const Text('Logout'))
                ],
              ),
            ),
          );
  }
}
