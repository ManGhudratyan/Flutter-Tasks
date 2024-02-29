import 'package:create_account/widgets/text_form.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool _isFormValid = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create an account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Color.fromRGBO(82, 84, 100, 1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _globalKey,
              onChanged: () {
                setState(() {
                  _isFormValid = _globalKey.currentState!.validate();
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextForm(
                    validator: (value) {
                      if (value == null ||
                          !value.contains('@') ||
                          !value.contains('.') ||
                          value.length <= 3) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  TextForm(
                    validator: (value) {
                      if (value == null || !value.isNotEmpty) {
                        return 'Field can not be empty';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Full Name',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  TextForm(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.length <= 6) {
                        return 'Password must be at least 6 characters long';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TextForm(
                    controller: _repeatPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please repeat your password';
                      } else if (value == _passwordController.text) {
                        return 'Passwords do not match';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Repeat Password',
                    obscureText: true,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Checkbox(
                            value: _isChecked,
                            onChanged: (newValue) {
                              setState(() {
                                _isChecked = newValue!;
                              });
                            },
                          ),
                        ),
                        const TextSpan(
                          text: 'I agree to the app ',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        const TextSpan(
                          text: 'terms & conditions ',
                          style: TextStyle(
                              color: Color.fromRGBO(132, 199, 255, 1),
                              fontSize: 18),
                        ),
                        const TextSpan(
                          text: 'and ',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        const TextSpan(
                          text: 'privacy policy',
                          style: TextStyle(
                              color: Color.fromRGBO(132, 199, 255, 1),
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: _isFormValid
                          ? const Color.fromRGBO(132, 199, 255, 1)
                          : const Color.fromRGBO(213, 213, 213, 1),
                    ),
                    onPressed: _isFormValid ? () {} : null,
                    child: const Text('Create'),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: <Widget>[
                      Text(
                        'I already registered   ',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text('Sign in',
                          style: TextStyle(
                              color: Color.fromRGBO(132, 199, 255, 1),
                              fontSize: 17))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
