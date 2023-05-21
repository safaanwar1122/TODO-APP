import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOTES APP'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(//in  form all TextFormField() used in cloumn act as single widget or appear in column

          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField()

              ],
            ),
          ),
        ),
      ),
    );
  }
}
