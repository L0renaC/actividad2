import 'package:flutter/material.dart';
import 'package:actividad2/views/widgets/Inicio.dart'; 

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contraseña aleatoria",
            style: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold, 
            ),
          ),
          centerTitle: true, 
          backgroundColor: Colors.deepPurple,
        ),
        body: Inicio(), 
      ),
    );
  }
}
