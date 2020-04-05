import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/shared_prefs/preferencias_usuario.dart';
import 'package:flutter_user_preferences/src/widgets/drawer_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;

  final prefs = new PreferenciasUsuario();

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _textEditingController = new TextEditingController(text: prefs.nombreUsuario);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: DrawerWidget(SettingsPage.routeName),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text('Settings', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value)=>setState((){
              _colorSecundario = value;
              prefs.colorSecundario = value;
            }),
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Nombre',
                labelText: 'Nombre',
                alignLabelWithHint: true,
                helperText: 'Nombre de la persona usando el telefono'
              ),
              onChanged: (value){
                prefs.nombreUsuario = value;
              },
            ),
          ),
        ],
      ),
      
    );
  }

  void _setSelectedRadio(int value) {
    prefs.genero = value;
    setState((){
      _genero = value;
    });
  }
}