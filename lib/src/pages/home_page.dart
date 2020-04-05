import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/shared_prefs/preferencias_usuario.dart';
import 'package:flutter_user_preferences/src/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    
    final appbarColor = prefs.colorSecundario?'Secundario':'Primario';

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: DrawerWidget(routeName),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color AppBar: $appbarColor'),
          Divider(),
          Text('Género: ${prefs.generoFormated}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
      
    );
  }
}