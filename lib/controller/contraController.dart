import 'dart:math';

class PasswordController {
  static const String letrasMayusculas = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const String letrasMinusculas = 'abcdefghijklmnopqrstuvwxyz';
  static const String letrasfacil = 'ABCDEFGHJKLMNPQRSTUVWXYZ';
  static const String numerosFacil = '23456789';
  static const String numeros = '0123456789';
  static const String simbolos = '!@#\$%^&*()_+-=[]{}|;:\'",.<>?/';

  String generarContra(int longitud, bool incluirMayusculas, bool incluirMinusculas, bool incluirNumeros, bool incluirSimbolos, bool facilDeLeer) {
    String caracteresPermitidos = '';
    if (facilDeLeer) {
      if (incluirMinusculas) caracteresPermitidos += letrasMinusculas;
      if (incluirNumeros) caracteresPermitidos += numerosFacil;
      if (incluirMayusculas) caracteresPermitidos += letrasfacil;
     
    } else {
      if (incluirMayusculas) caracteresPermitidos += letrasMayusculas;
      if (incluirMinusculas) caracteresPermitidos += letrasMinusculas;
      if (incluirNumeros) caracteresPermitidos += numeros;
    }

    if (incluirSimbolos) caracteresPermitidos += simbolos;

    if (caracteresPermitidos.isEmpty) {
      throw ArgumentError('Debe seleccionar al menos un tipo de caracteres para generar la contraseña.');
    }

    return List.generate(longitud, (index) {
      final indexAleatorio = Random().nextInt(caracteresPermitidos.length);
      return caracteresPermitidos[indexAleatorio];
    }).join('');
  }
}
