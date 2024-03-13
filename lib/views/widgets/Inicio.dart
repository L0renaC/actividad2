import 'package:flutter/material.dart';
import 'package:actividad2/controller/contraController.dart'; 
class Inicio extends StatefulWidget {
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  double _currentSliderValue = 20;
  Map<String, dynamic> values = {
    'allow': false,  
    'mayuscula': false,
    'minuscula': false,
    'numero': false,
    'simbolo': false,
    'facil':false,
    'valid': false,
    'accepted': '',
    'name': '',
    'lastname': ''
  };
  final PasswordController _passwordController = PasswordController();
  final TextEditingController _textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        TextField(
          controller: _textController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Contraseña',
          ),
        ),
        const SizedBox(height: 20), 
        const Text(
          "Personalice su contraseña",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold, 
          ),
        ),
        const SizedBox(height: 10),
        Slider(
          value: _currentSliderValue,
          max: 20,
          divisions: 10,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
        RadioListTile(
          title: const Text("Fácil de decir"),
          value: 'YES',
          groupValue: values["accepted"],
          onChanged: (newValue) {
            setState(() {
              if (newValue == 'YES') {
                values["mayuscula"] = true;
                values["minuscula"] = true;
                values["numero"] = false;
                values["simbolo"] = false;
              }
              values["accepted"] = newValue;
            });
          },
        ),
        RadioListTile(
          title: const Text("Fácil de decir"),
          value: false,
          groupValue: values["accepted"],
          onChanged: (newValue) {
            setState(() {
              values["accepted"] = newValue;
              values["facil"]=newValue;
            });
          },
        ),
        RadioListTile(
          title: const Text("Todos los caracteres"),
          value: true,
          groupValue: values["accepted"],
          onChanged: (newValue) {
            setState(() {
              if (newValue == true) {
                values["mayuscula"] = true;
                values["minuscula"] = true;
                values["numero"] = true;
                values["simbolo"] = true;
              }
              values["accepted"] = newValue;
            });
            setState(() {
              values["mayuscula"] = newValue;
              values["minuscula"] = newValue;
              values["numero"] = newValue;
              values["simbolo"] = newValue;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Mayúsculas"),
          value: values["mayuscula"],
          onChanged: (newValue) {
            setState(() {
              values["mayuscula"] = newValue;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Minúsculas"),
          value: values["minuscula"],
          onChanged: (newValue) {
            setState(() {
              values["minuscula"] = newValue;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Números"),
          value: values["numero"],
          onChanged: values["accepted"] == 'YES' ? null : (newValue) {
            setState(() {
              values["numero"] = newValue;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Simbolos"),
          value: values["simbolo"],
          onChanged: values["accepted"] == 'YES' ? null : (newValue) {
            setState(() {
              values["simbolo"] = newValue;
            });
          },
        ),
        ElevatedButton(
           onPressed: () {
            setState(() {
              String nuevaContra;
              if(values["accepted"]=='YES'){
                values["facil"]=false;
              }else if(values["accepted"]== false){
                values["facil"]=true;
              }else if(values["accepted"]==true){
                values["facil"]=false;
              }
              if (values["mayuscula"] || values["minuscula"] || values["numero"] || values["simbolo"]) {
                nuevaContra = _passwordController.generarContra(
                  _currentSliderValue.toInt(),
                  values["mayuscula"],
                  values["minuscula"],
                  values["numero"],
                  values["simbolo"],
                  values["facil"]
                );
              } else {
                nuevaContra = "Debes seleccionar al menos una opción.";
              }
              _textController.text = nuevaContra;
            });
          },
          child: Text('Generar Contraseña'),
        ),
      ],
    );
  }
}