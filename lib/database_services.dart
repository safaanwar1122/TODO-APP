import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'add_post.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
final CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');

class DataBaseServices {
  //create instance outside function bcz of global scope in order to access for delete, update etc

  //future function created here
  static Future<void> addData(String title, String detail) async {
    firebaseFirestore
        .collection('notes')
        .add({
          "title": title,
          "detail": detail,
        })
        .whenComplete(() => print('added successfully'))
        .catchError((e) {
          print(e.toString());
        });
  }
}
