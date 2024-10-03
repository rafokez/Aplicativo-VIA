import 'package:flutter/material.dart';

class TelaEsqueciSenha1 extends StatelessWidget {
  const TelaEsqueciSenha1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF272A33), // Cor da navbar ajustada
        title: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(90),
          ),
          child: Center(
            child: Image.asset(
              'lib/assets/image/logovia.png', // Imagem da navbar ajustada
              height: 100,
              width: 100,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // Título "Esqueceu sua senha?" ajustado
                const Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(
                    fontSize: 32, // Fonte maior
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF272A33),
                    fontFamily: 'MinhaFonte',
                  ),
                ),
                const SizedBox(height: 20),
                // Imagem centralizada abaixo do título
                Image.asset(
                  'lib/assets/image/imagemesqueceusenha.png', // Imagem padronizada
                  height: 260,
                  width: 260,
                ),
                const SizedBox(height: 0), // Menos espaço entre a imagem e a frase
                // Frase dividida em duas linhas
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Não se preocupe com isto.\n',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF737373),
                          fontFamily: 'MinhaFonte',
                        ),
                      ),
                      TextSpan(
                        text: 'Vamos ajudá-lo a recuperá-la.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF737373),
                          fontFamily: 'MinhaFonte',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                // Novo texto
                const Text(
                  'Digite seu e-mail vinculado à sua conta:',
                  style: TextStyle(
                    fontSize: 20, // Tamanho menor que o título
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF272A33),
                    fontFamily: 'MinhaFonte',
                  ),
                ),
                const SizedBox(height: 16),
                // Campo de entrada para o e-mail
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email, color: Color(0xFF272A33)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      hintText: 'Digite seu e-mail',
                      filled: true,
                      fillColor: const Color(0xFFE7DDBF), // Cor do fundo igual à da tela
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF272A33), width: 1),
                      ),
                    ),
                    style: const TextStyle(fontFamily: 'MinhaFonte'),
                  ),
                ),
                const SizedBox(height: 16),
                // Frase abaixo do campo de entrada
                const Text(
                  'Nós enviaremos um código de autenticação.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF737373),
                    fontFamily: 'MinhaFonte',
                  ),
                ),
                const SizedBox(height: 30),
                // Botão para avançar com efeito de hover
                GestureDetector(
                  onTapDown: (_) {
                    // Lógica para animação ao clicar
                  },
                  onTapUp: (_) {
                    // Lógica para animação ao clicar
                  },
                  child: AnimatedScale(
                    scale: 1.0,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF272A33), // Cor do botão
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 130),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/esqueci_senha_2'); // Navega para a tela de recuperação de senha 2
                      },
                      child: const Text(
                        'Avançar',
                        style: TextStyle(
                          color: Color(0xFFE7DDBF),
                          fontSize: 18,
                          fontFamily: 'MinhaFonte',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFE7DDBF), // Cor de fundo ajustada
    );
  }
}
