import 'package:flutter/material.dart';
import 'package:livrosmaisvendidos/view/pagina_inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Livros Mais Vendidos',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: PaginaInicial(),
    );
  }
}