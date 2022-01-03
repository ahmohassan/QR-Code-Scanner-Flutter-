// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class stack extends StatelessWidget {
  const stack({Key? key}) : super(key: key);
  final prof =
      "https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_960_720.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 290,
            padding: EdgeInsets.all(20),
            child: Center(
                child: Text(
              "I am Programer",
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
              ),
            )),
          ),
          Profile_widget(prof: prof)
        ],
      ),
    );
  }
}

class Profile_widget extends StatelessWidget {
  const Profile_widget({
    Key? key,
    required this.prof,
  }) : super(key: key);

  final String prof;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -65,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 8),
                blurRadius: 8.2,
                spreadRadius: 0.1,
                // blurStyle: BlurStyle.outer,
                color: Colors.black.withOpacity(0.8),
              ),
            ],
            // border: Border.all(
            //   width: 5,
            //   // color: Colors.white,
            //   style: BorderStyle.solid,
            // ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(prof),
            ),
          ),
        ),
      ),
    );
  }
}
