import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/shared_prefs/preferencias_usuario.dart';

class DrawerWidget extends StatelessWidget {

  final String actualRoute;
  final prefs = new PreferenciasUsuario();

  DrawerWidget(this.actualRoute);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Quita el padding superior
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            // child: Text('Mi Menú'),
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue,),
            title: Text('Home'),
            onTap: (){
              if(actualRoute == 'home') Navigator.pop(context);
              else {
                prefs.ultimaPagina = 'home';
                Navigator.pushReplacementNamed(context, 'home');
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue,),
            title: Text('Party Mode'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue,),
            title: Text('People'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue,),
            title: Text('Settings'),
            onTap: (){
              // Cierra todas las pages que esten en el stack y abre una
              if(actualRoute == 'settings') Navigator.pop(context);
              else {
                prefs.ultimaPagina = 'settings';
                Navigator.pushReplacementNamed(context, 'settings');
              }
            },
          ),
        ],
      ),
    );
  }
}