import 'package:flutter/material.dart';

class TelaFeedbacks extends StatelessWidget {
  const TelaFeedbacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF272A33),
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: Center(
            child: Image.asset(
              'lib/assets/image/logovia.png', // Substitua pelo caminho do seu logotipo
              height: 60,
              width: 60,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 26),
            const Text(
              'Feedbacks enviados',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF272A33),
                fontFamily: 'MinhaFonte',
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xFF272A33),
            ),
            const SizedBox(height: 36),
            // Imagem abaixo do título
            Center(
              child: Image.asset(
                'lib/assets/image/imagemfeedback.png', // Substitua pelo caminho da sua imagem
                height: 200,
              ),
            ),
            const SizedBox(height: 36),
            // Lista de feedbacks
            const FeedbackButton(
              date: '26/06/2024',
              description: 'Trajeto de Av. Sp',
            ),
            const SizedBox(height: 16),
            const FeedbackButton(
              date: '20/06/2024',
              description: 'Trajeto de Camboriú',
            ),
            const SizedBox(height: 16),
            const FeedbackButton(
              date: '17/06/2024',
              description: 'Trajeto de Campinas',
            ),
            const SizedBox(height: 36),
            // Texto "Não há mais feedbacks"
            const Center(
              child: Text(
                'Não há mais feedbacks enviados por você.',
                style: TextStyle(
                  color: Color(0xFF272A33),
                  fontSize: 16,
                  fontFamily: 'MinhaFonte',
                ),
              ),
            ),
            const Spacer(),
            // Botão "Retornar"
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF272A33),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 130),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Retornar',
                  style: TextStyle(
                    color: Color(0xFFE7DDBF),
                    fontSize: 18,
                    fontFamily: 'MinhaFonte',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Rodapé com direitos autorais
            const Center(
              child: Text(
                '© Equipe Legacy - Todos os direitos reservados VIA 2024',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF737373),
                  fontFamily: 'MinhaFonte',
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFE7DDBF),
    );
  }
}

class FeedbackButton extends StatelessWidget {
  final String date;
  final String description;

  const FeedbackButton({required this.date, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE7DDBF),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFF272A33), width: 1),
          ),
        ),
        onPressed: () {
          // Ação ao clicar no feedback
        },
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Icon(Icons.flag, color: Color(0xFF272A33)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                '$date - $description',
                style: const TextStyle(
                  color: Color(0xFF272A33),
                  fontSize: 16,
                  fontFamily: 'MinhaFonte',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}