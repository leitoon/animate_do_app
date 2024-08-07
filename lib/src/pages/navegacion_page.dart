
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NotificationModel(),
      child: Scaffold(
        
        appBar: AppBar
        (
          backgroundColor: Colors.pink,
          title: const Text('Notifications Page'),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation()
      ),
    );
  }
}
class BottomNavigation extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final int numero =Provider.of<_NotificationModel>(context).numero;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: 
      [
        const BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone)),
          BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: 
            [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0,
                //child: Icon(Icons.brightness_1, size: 8,color: Colors.redAccent,))
                child: BounceInDown(
                  animate: (numero > 0) ?true:false,
                  from: 10,
                  child: Bounce(
                    from: 10,
                    controller: (controller) => Provider.of<_NotificationModel>(context,listen: false).bounceController=controller,
                    child: Container
                    (
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration
                      (
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                      child: Text(
                      
                        '$numero',style: TextStyle(color: Colors.white,fontSize:8 ),
                        
                        textAlign: TextAlign.center,),
                    ),
                  ),
                ),
          )],
          )),
          const BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog))
      ]
      );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: ()
    {
      final notiModel=Provider.of<_NotificationModel>(context,listen: false);

      int numero= notiModel.numero;
      numero++;
      notiModel.numero=numero;
      if(numero >= 2)
      {
        final controller = notiModel.bounceController; 
        controller.forward(from: 0.0);
      }
    },
      backgroundColor: Colors.pink,
    child: const FaIcon(
      FontAwesomeIcons.play,color: Colors.white,),
    );
  }
}

class _NotificationModel extends ChangeNotifier 
{
  int _numero=0;
  late AnimationController _bounceController;
  int get numero => _numero;

  set numero (int valor) 
  {
    _numero=valor;
    notifyListeners();
  }
  AnimationController get bounceController=>_bounceController;
  set bounceController(AnimationController controller)
  {
    _bounceController=controller;
    //notifyListeners();
  }
}