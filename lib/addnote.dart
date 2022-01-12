import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'title': title.text,
                'content': content.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text(
              "save",
            ),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                            BorderSide(color: Colors.blue, width: 2.0)
                    ),
                    hintText: 'Task',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextField(
                    controller: content,
                    expands: true,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Description',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}