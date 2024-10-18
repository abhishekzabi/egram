
import 'package:egram/presentation/pages/news/newsadd.dart';
import 'package:flutter/material.dart';

class PasswordEntryPage extends StatefulWidget {
  @override
  _PasswordEntryPageState createState() => _PasswordEntryPageState();
}

class _PasswordEntryPageState extends State<PasswordEntryPage> {
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  // Correct password
  final String _correctPassword = "latestnews";

  void _validatePassword() {
    String enteredPassword = _passwordController.text;

    if (enteredPassword == _correctPassword) {
      // Navigate to the next page if the password is correct
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>const AddNewsPage ()),
      );
    } else {
      // Show error message if the password is incorrect
      setState(() {
        _errorMessage = "Incorrect password. Please try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                errorText: _errorMessage,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validatePassword,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

