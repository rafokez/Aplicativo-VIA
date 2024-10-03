import 'package:flutter/material.dart';

class TelaHistoricoViagens extends StatelessWidget {
  const TelaHistoricoViagens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF272A33),
        automaticallyImplyLeading: false, // Remove a seta de voltar
        title: SizedBox(
          height: 50,
          child: Center(
            child: Image.asset(
              'lib/assets/image/logovia.png',
              height: 60,
              width: 60,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0, // Remove a sombra da AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Espaçamento adicional abaixo da AppBar
              const SizedBox(height: 26),

              // Título alinhado à esquerda com linha horizontal
              const Text(
                'Histórico de viagens',
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

              // Botões de histórico de viagens
              _buildTravelButton('26/06/2024 - Trajeto de Av. Sp'),
              const SizedBox(height: 16),
              _buildTravelButton('20/06/2024 - Trajeto de Camboriú'),
              const SizedBox(height: 16),
              _buildTravelButton('17/06/2024 - Trajeto de Campinas'),
              const SizedBox(height: 16),
              _buildTravelButton('26/06/2024 - Trajeto de Av. Sp'),
              const SizedBox(height: 16),
              _buildTravelButton('20/06/2024 - Trajeto de Camboriú'),
              const SizedBox(height: 16),
              _buildTravelButton('17/06/2024 - Trajeto de Campinas'),
              const SizedBox(height: 30),

              // Frase sobre viagens realizadas
              const Text(
                'Não há mais viagens realizadas.',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF272A33),
                  fontFamily: 'MinhaFonte',
                ),
              ),
              const SizedBox(height: 45),

              // Linha horizontal centralizada acima do botão "Retornar"
              Center(
                child: Container(
                  width: 100, // Ajuste a largura conforme necessário
                  height: 1,
                  color: const Color(0xFF272A33),
                ),
              ),
              const SizedBox(height: 30),

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
                    Navigator.pushNamed(context, '/configuracao'); // Navega para a tela de configuração
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
              const SizedBox(height: 40),

              // Frase de direitos autorais centralizada
              const Center(
                child: Text(
                  '© Equipe Legacy - Todos os direitos reservados VIA 2024',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF737373),
                    fontFamily: 'MinhaFonte',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFE7DDBF), // Cor de fundo igual ao app
    );
  }

  // Método para construir os botões de histórico de viagens
  Widget _buildTravelButton(String text) {
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
          // Lógica para histórico de viagens
        },
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Icon(Icons.access_time, color: Color(0xFF272A33)), // Ícone de relógio
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text, // Texto agora aparece corretamente
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
