import 'package:flutter/material.dart';

class TelaCadastroUsuario1 extends StatelessWidget {
  const TelaCadastroUsuario1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF272A33),
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
        automaticallyImplyLeading: false, // Remove a seta de voltar
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Título centralizado
                const Text(
                  'Cadastro de Usuário',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF272A33),
                    fontFamily: 'MinhaFonte',
                  ),
                ),
                const SizedBox(height: 8),
                // Linha abaixo do título
                Container(
                  width: 200,
                  height: 1,
                  color: const Color(0xFF272A33),
                ),
                const SizedBox(height: 8),
                // Subtítulo centralizado
                const Text(
                  'Informações Básicas',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF272A33),
                    fontFamily: 'MinhaFonte',
                  ),
                ),
                const SizedBox(height: 30),
                // Layout com a imagem e os inputs
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagem à esquerda, com um ajuste de posição para baixo
                    Align(
                      alignment: Alignment.topLeft, // Ajusta a posição vertical
                      child: Container(
                        width: 140,  // Ajuste o tamanho conforme necessário
                        height: 140,  // Ajuste o tamanho conforme necessário
                        margin: const EdgeInsets.only(top: 98), // Ajuste a margem superior para mover a imagem para baixo
                        child: Image.asset(
                          'lib/assets/image/imagemlogin.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Inputs ao lado da imagem
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nome
                          const Text(
                            'Nome:',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF272A33),
                              fontFamily: 'MinhaFonte',
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person, color: Color(0xFF272A33)),
                              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              hintText: 'Digite seu nome',
                              filled: true,
                              fillColor: const Color(0xFFE7DDBF), // Cor do fundo igual à da tela
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Color(0xFF272A33), width: 1),
                              ),
                            ),
                            style: const TextStyle(fontFamily: 'MinhaFonte'),
                          ),
                          const SizedBox(height: 16),
                          // Sobrenome
                          const Text(
                            'Sobrenome:',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF272A33),
                              fontFamily: 'MinhaFonte',
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person, color: Color(0xFF272A33)),
                              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              hintText: 'Digite seu sobrenome',
                              filled: true,
                              fillColor: const Color(0xFFE7DDBF), // Cor do fundo igual à da tela
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Color(0xFF272A33), width: 1),
                              ),
                            ),
                            style: const TextStyle(fontFamily: 'MinhaFonte'),
                          ),
                          const SizedBox(height: 16),
                          // Email
                          const Text(
                            'E-mail:',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF272A33),
                              fontFamily: 'MinhaFonte',
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email, color: Color(0xFF272A33)),
                              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              hintText: 'Digite seu email',
                              filled: true,
                              fillColor: const Color(0xFFE7DDBF), // Cor do fundo igual à da tela
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Color(0xFF272A33), width: 1),
                              ),
                            ),
                            style: const TextStyle(fontFamily: 'MinhaFonte'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Inputs de senha centralizados e maiores horizontalmente
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Senha:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF272A33),
                      fontFamily: 'MinhaFonte',
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity, // Ajusta para a largura disponível
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Color(0xFF272A33)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      hintText: 'Digite sua senha',
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
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirme sua senha:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF272A33),
                      fontFamily: 'MinhaFonte',
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity, // Ajusta para a largura disponível
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Color(0xFF272A33)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      hintText: 'Confirme sua senha',
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
                const SizedBox(height: 30),
                // Botão "Avançar"
                GestureDetector(
                  onTapDown: (_) {
                    // Logic for small animation
                  },
                  onTapUp: (_) {
                    // Logic for small animation
                  },
                  child: AnimatedScale(
                    scale: 1.0,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF272A33),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 130),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastro_usuario_2'); // Navegar para a tela de cadastro de usuário 2
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
                const SizedBox(height: 20),
                // Frase abaixo do botão centralizada com partes em negrito e cor diferente
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Ao avançar, você concorda com todos os ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF737373),
                      fontFamily: 'MinhaFonte',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Termos do Aplicativo VIA',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF272A33),
                          fontFamily: 'MinhaFonte',
                        ),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF737373),
                          fontFamily: 'MinhaFonte',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFE7DDBF),
    );
  }
}
