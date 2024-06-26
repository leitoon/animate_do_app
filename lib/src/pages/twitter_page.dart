

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  const TwitterPage({super.key});

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool activar=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      floatingActionButton: FloatingActionButton(onPressed: ()
      {
        setState(() {
          activar=true;
        });
      },
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play,color: Colors.white,),
      ),
      backgroundColor: const Color(0xff1DA1F2),
      body: Center(child: 
      ZoomOut(
        animate: activar,
        from: 30,
        duration: const Duration(seconds: 1),
        child: const FaIcon(FontAwesomeIcons.twitter,
        color: Color.fromRGBO(255, 255, 255, 1),
        size: 40,
        ),
      )),
    );
  }
}