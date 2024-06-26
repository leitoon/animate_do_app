
import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar
     (
      title: FadeIn(
        duration: Duration(milliseconds: 500),
        child: Text('Animate_do')),
      actions: 
      [
        IconButton(onPressed: (){
           Navigator.push(context, CupertinoDialogRoute(builder: ( (context) => TwitterPage()), context: context));
        }, 
        icon: const FaIcon(FontAwesomeIcons.twitter)),

        SlideInLeft(
          from: 100,
          child: IconButton(onPressed: ()
          {
            Navigator.push(context, CupertinoDialogRoute(builder: ( (context) => Pagina1Page()), context: context));
          }, 
          icon: const FaIcon(Icons.navigate_next)),
        )
      ],
     ) ,
     floatingActionButton: ElasticInRight(
       child: FloatingActionButton(
        onPressed: ()
        {
          Navigator.push(context, CupertinoDialogRoute(builder: ( (context) =>  NavegacionPage()), context: context));
         
        },
        child: const FaIcon(FontAwesomeIcons.play),
        ),
     ),

      body:  Center
      (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
             ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(Icons.new_releases,color: Colors.blue, size: 40,)),
             FadeInDown(
              delay: Duration(milliseconds: 200),
               child: Text('Titulo', style: 
                           TextStyle
                           (
                fontSize: 40,
                fontWeight: FontWeight.w200
                           ),),
             ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text('Soy un texto pequeño', style: 
              TextStyle
              (
                fontSize: 20,
                fontWeight: FontWeight.w200
              ),),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container
              (
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
     );
  }
}