import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/views/tela_configuracoes.dart';
import 'package:google_maps_in_flutter/views/tela_viagem_metro.dart';
import 'package:google_maps_in_flutter/views/tela_viagem_trem.dart';
import 'detail_page.dart'; // Certifique-se de criar este arquivo
import 'tela_notificacao.dart'; // Certifique-se de criar este arquivo

class TourismPage extends StatefulWidget {
  const TourismPage({super.key});

  @override
  _TourismPageState createState() => _TourismPageState();
}

class _TourismPageState extends State<TourismPage> {
  late GoogleMapController mapController;

  // Coordenadas de São Paulo
  final LatLng _center = const LatLng(-23.587416, -46.657634);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _showTransportChoiceDialog(String address) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha o meio de transporte'),
          content: Text('Você deseja ir de trem ou de metrô para $address?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Trem'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(address: address, transportMode: 'Trem'),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text('Metrô'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(address: address, transportMode: 'Metrô'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showLocationConfirmationDialog(String address) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'lib/assets/image/ibirapuera.jpeg', // Substitua pelo caminho correto da imagem
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Parque Ibirapuera',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'É deste local que você está se referindo?',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Fecha a mensagem de confirmação
                      _showTransportChoiceDialog(address); // Exibe a escolha de transporte
                    },
                    child: const Text('Sim'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Fecha a mensagem de confirmação
                    },
                    child: const Text('Não'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomNavBarItem(IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          Text(label, style: TextStyle(color: color)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const appBarColor = Color(0xFF272A33);
    const bottomNavBarColor = Color(0xFF272A33);
    const iconColor = Color(0xFFE4E4E4);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'lib/assets/logo.png',
          height: 40,
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaNotificacao()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar ponto turístico...',
                hintStyle: const TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: appBarColor,
              ),
              style: const TextStyle(color: Colors.white),
              onSubmitted: (String value) {
                _showLocationConfirmationDialog(value); // Exibe a confirmação da localização
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: bottomNavBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavBarItem(Icons.directions_subway, 'Metrô', iconColor, () {
              Navigator.pushNamed(context, '/viagem_metro');
            }),
            _buildBottomNavBarItem(Icons.train, 'Trem', iconColor, () {
              Navigator.pushNamed(context, '/viagem_trem');
            }),
            _buildBottomNavBarItem(Icons.home, 'Home', iconColor, () {
              Navigator.pushNamed(context, '/home');
            }),
            _buildBottomNavBarItem(Icons.map, 'Turismo', const Color(0xFFE7DDBF), () {
              Navigator.pushNamed(context, '/tourism');
            }),
            _buildBottomNavBarItem(Icons.settings, 'Config.', iconColor, () {
              Navigator.pushNamed(context, '/configuracao');
            }),
          ],
        ),
      ),
    );
  }
}