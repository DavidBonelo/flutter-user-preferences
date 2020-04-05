import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();
    
    // variable usada para guardar el genero como texto
    String _generoFormated;
    
    
    // Singleton

    factory PreferenciasUsuario(){
      return _instancia;
    }

    PreferenciasUsuario._internal();

    SharedPreferences _prefs;

    // Ver el uso de este metodo en main.dart para asegurar que se cree la instancia desde antes que se empiece a ejecutar la app
    initPrefs() async {
      this._prefs = await SharedPreferences.getInstance();
    }
  
    // bool    _colorSecundario;
    // int    _genero;
    // String _nombre;

    get colorSecundario {
      return _prefs.getBool('colorSecundario') ?? false;
    }
    set colorSecundario( bool value ) {
      _prefs.setBool('colorSecundario', value);
    }
    get nombreUsuario {
      return _prefs.getString('nombreUsuario') ?? '';
    }
    set nombreUsuario( String value ) {
      _prefs.setString('nombreUsuario', value);
    }
    get ultimaPagina {
      return _prefs.getString('ultimaPagina') ?? 'home';
    }
    set ultimaPagina( String ruta ) {
      _prefs.setString('ultimaPagina', ruta);
    }

    get genero {
      return _prefs.getInt('genero') ?? 1;
    }
    set genero( int value ) {

      if (value == 1) _generoFormated = 'Masculino';
      else _generoFormated = 'Femenino';

      _prefs.setInt('genero', value);
    }
    // El genero lo formateo aparte porque el genero como int es necesario para saber el radio selecionado 
    get generoFormated {
      return _generoFormated ?? '';
    }
}