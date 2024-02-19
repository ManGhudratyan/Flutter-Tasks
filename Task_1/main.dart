import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(250, 250, 252, 1),
            title: const Text(
              'Create an account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Repeat Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromRGBO(213, 213, 213, 1)),
                  onPressed: null,
                  child: const Text('Create')),
              const SizedBox(height: 20),
              const Row(
                children: <Widget>[
                  Text('I already registered   '),
                  Text('Sign in',
                      style: TextStyle(color: Color.fromRGBO(132, 199, 255, 1)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
