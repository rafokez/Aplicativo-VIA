import 'package:flutter/material.dart';

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 26),
              const Text(
                'Seu perfil e informações',
                style: TextStyle(
                  fontSize: 30,
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
              const SizedBox(height: 56),

              // Campos de entrada com funcionalidade de edição
              const _EditableField(
                initialValue: 'Nome',
                icon: Icons.person,
              ),
              const SizedBox(height: 16),
              const _EditableField(
                initialValue: 'E-mail',
                icon: Icons.email,
              ),
              const SizedBox(height: 16),
              const _EditableField(
                initialValue: 'Telefone',
                icon: Icons.phone,
              ),
              const SizedBox(height: 16),
              const _EditableField(
                initialValue: 'Data de nascimento',
                icon: Icons.calendar_today,
              ),
              const SizedBox(height: 16),
              const _EditableField(
                initialValue: 'CPF',
                icon: Icons.credit_card,
                isEditable: false, // CPF não editável
              ),
              const SizedBox(height: 90),

              Center(
                child: Container(
                  width: 100,
                  height: 1,
                  color: const Color(0xFF272A33),
                ),
              ),
              const SizedBox(height: 65),

              Center(
                child: GestureDetector(
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
                ),
              ),
              const SizedBox(height: 80),

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
      backgroundColor: const Color(0xFFE7DDBF),
    );
  }
}

class _EditableField extends StatefulWidget {
  final String initialValue;
  final IconData icon;
  final bool isEditable;

  const _EditableField({
    required this.initialValue,
    required this.icon,
    this.isEditable = true, // Por padrão, o campo é editável
  });

  @override
  _EditableFieldState createState() => _EditableFieldState();
}

class _EditableFieldState extends State<_EditableField> {
  late TextEditingController _controller;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  void _toggleEditing() {
    if (widget.isEditable) {
      setState(() {
        _isEditing = !_isEditing;
      });
    }
  }

  void _saveChanges() {
    // Adicione a lógica para salvar as alterações, se necessário
    print('Salvando: ${_controller.text}');
    _toggleEditing();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      enabled: _isEditing && widget.isEditable,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: const Color(0xFF272A33)),
        suffixIcon: widget.isEditable
            ? (_isEditing
                ? IconButton(
                    icon: const Icon(Icons.save, color: Color(0xFF272A33)),
                    onPressed: _saveChanges,
                  )
                : IconButton(
                    icon: const Icon(Icons.edit, color: Color(0xFF272A33)),
                    onPressed: _toggleEditing,
                  ))
            : null, // Remove o ícone de edição se o campo não for editável
        filled: true,
        fillColor: const Color(0xFFE7DDBF),
        labelText: widget.initialValue,
        labelStyle: const TextStyle(
          color: Color(0xFF272A33),
          fontSize: 16,
          fontFamily: 'MinhaFonte',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF272A33), width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
    );
  }
}