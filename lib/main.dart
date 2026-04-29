import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 185, 16, 117),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 185, 89, 159)),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 119, 2, 84),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  final Random _random = Random();

  static const Color _roxo = Color.fromARGB(255, 207, 121, 178);
  static const Color _roxoClaro = Color(0xFFF0EFFF);
  static const Color _roxoMedio = Color.fromARGB(255, 219, 176, 204);
  static const Color _cinza = Color.fromARGB(255, 210, 184, 184);

  // ✅ LISTA FIXA DE FRASES
  final List<String> _frases = [
    "Um passo pequeno ainda é um passo, não desista!",
    "Os nossos sonhos merecem nossa disciplina, persista!",
    "Você é mais forte do que imagina.",
    "Você é a unica pessoa no mundo pra quem precisa ser boa o suficiente.",
    "Não chore, o Justin Bieber não gostaria de te ver triste",
    "Acreditar em sim mesmo é o inicio silencioso de todas as revoluções",
    "Você é substituivel naquilo que faz, mas nunca naquilo que é!",
    "Seja sua maior prioridade!",
    "Esteja a altura das suas exigências",
    "Se você quer ser, é porque algo em você já é!"
  ];

  // ✅ SORTEIO SIMPLES (SEMPRE FUNCIONA)
  void _sortear() {
    final int indice = _random.nextInt(_frases.length);
    final String frase = _frases[indice];

    _mostrarResultado(frase);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _roxoClaro,

      appBar: AppBar(
        title: const Text('Frases Motivacionais'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // ✅ IMAGEM GRANDE (igual ao seu app)
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpQm1MNpLZDxsLmE6uUV9-dYGd2H42TtHgweSYUCgE&s',
                height: 160,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 160,
                  color: _roxoMedio,
                  child: const Center(
                    child: Text('💬', style: TextStyle(fontSize: 64)),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Clique no botão para gerar uma frase motivacional',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 86, 3, 40)),
            ),

            const SizedBox(height: 30),

            // ✅ BOTÃO (AGORA SEMPRE ATIVO)
            ElevatedButton.icon(
              onPressed: _sortear,
              icon: const Icon(Icons.auto_awesome),
              label: const Text(
                'GERAR FRASE',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _roxo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ✅ MESMO DIALOG (quase igual ao seu)
  void _mostrarResultado(String resultado) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: _roxoMedio,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text('✨', style: TextStyle(fontSize: 40)),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Sua frase:',
                style: TextStyle(fontSize: 14, color: _cinza),
              ),

              const SizedBox(height: 8),

              Text(
                resultado,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _roxo,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                Future.delayed(const Duration(milliseconds: 200), _sortear);
              },
              child: const Text('Outra'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(dialogContext),
              style: ElevatedButton.styleFrom(
                backgroundColor: _roxo,
                foregroundColor: Colors.white,
              ),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}