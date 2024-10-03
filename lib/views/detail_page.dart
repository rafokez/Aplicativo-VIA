import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String address;
  final String transportMode;

  const DetailPage({
    super.key,
    required this.address,
    required this.transportMode,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late String address;
  late String transportMode;

  @override
  void initState() {
    super.initState();
    address = widget.address;
    transportMode = widget.transportMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Column(
            children: [
              Image.asset(
                'lib/assets/logo.png',
                height: 40,
              ),
              const SizedBox(height: 8),
              const Text(
                'Iniciando seu trajeto...',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF272A33),
        ),
      ),
      backgroundColor: const Color(0xFFE7DDBF),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: const Color(0xFF272A33),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Linha selecionada: Linha Lilás',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.train, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Linha Lilás - 12h00 / 20h00 - Bairro Santo Amaro',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Localização: Avenida Paulista 10309',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox.expand(
              child: Image.asset(
                'lib/assets/placeholder_metro.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/tela_finalizar_trajeto');
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.check),
            tooltip: 'Finalizar trajeto',
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () async {
              final newAddress = await _showAddressDialog(context);
              if (newAddress != null) {
                final confirmation = await _showConfirmationDialog(context);
                if (confirmation) {
                  setState(() {
                    address = newAddress;
                  });
                }
              }
            },
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: const Icon(Icons.edit),
            tooltip: 'Alterar trajeto',
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF272A33),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.train,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Ande até a estação de trem/metrô mais próxima',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.location_on, color: Colors.white70, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'Estação Jabaquara, Avenida Paulista 10309',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white, height: 1),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 1.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.access_time, color: Colors.white, size: 20),
                    SizedBox(width: 4),
                    Text(
                      'Tempo estimado: 54 minutos até o endereço',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.location_on, color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      address,
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> _showAddressDialog(BuildContext context) async {
    String? newAddress;
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Novo Endereço'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Digite o novo endereço',
            ),
            onChanged: (value) {
              newAddress = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirmar'),
              onPressed: () {
                Navigator.of(context).pop(newAddress);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Alteração'),
          content: const Text('Você tem certeza que deseja alterar o trajeto?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Confirmar'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}