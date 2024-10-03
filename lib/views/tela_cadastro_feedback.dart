import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/views/tela_feedback_efetuado.dart';

class TelaCadastroFeedback extends StatefulWidget {
  const TelaCadastroFeedback({Key? key}) : super(key: key);

  @override
  _TelaCadastroFeedbackState createState() => _TelaCadastroFeedbackState();
}

class _TelaCadastroFeedbackState extends State<TelaCadastroFeedback> {
  int _selectedStars = 0; // Variável para armazenar o número de estrelas selecionadas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7DDBF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF272A33),
        title: const Text('Feedback'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.check_circle,
              color: Color(0xFF272A33),
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Trajeto de Quinta-Feira às 14h32 Linha Lilás',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Descreva como foi o trajeto, sua experiência e em sua opinião o que deveria ser melhorado.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _selectedStars ? Icons.star : Icons.star_border, // Preenche a estrela até a seleção
                    color: const Color.fromARGB(255, 41, 41, 41), // Cor das estrelas
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedStars = index + 1; // Atualiza o número de estrelas selecionadas
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TelaFeedbackEfetuado()),
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF272A33),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Enviar feedback',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Lembre-se de destacar os pontos positivos e negativos do trajeto.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}