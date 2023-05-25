import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/database_services.dart';

class ADDTASK extends StatefulWidget {
  const ADDTASK({Key? key}) : super(key: key);

  @override
  State<ADDTASK> createState() => _ADDTASKState();
}

class _ADDTASKState extends State<ADDTASK> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('NOTES APP'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            //in  form all TextFormField() used in cloumn act as single widget or appear in column
            key: formKey, //this key can be accessed from other page as well
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter tite';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    minLines: 1,
                    maxLines: 5,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter detail';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter detail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple),
                          minimumSize: MaterialStateProperty.all(Size(40, 40))),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          DataBaseServices.addData(
                              titleController.text, descriptionController.text);
                        }
                      },
                      child: Text('Add Task')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
