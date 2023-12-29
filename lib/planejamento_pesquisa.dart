import 'package:flutter/material.dart';

class PlanejamentoPesquisaScreen extends StatelessWidget {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _qpController = TextEditingController();
  final TextEditingController _qsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planejamento de Pesquisa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Título',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 50,
              width: 520.0,
              child: TextField(
                controller: _tituloController,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: 'Digite o título...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 56),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                buildInput("QP", "QP...", _qpController, Icons.description),
                SizedBox(height: 20),
                buildInput("QS", "QS...", _qsController, Icons.search),
               ],
            ),
          ],
        ),
      ),
    );
  }
}
Widget buildInput(String label, String hint, TextEditingController controller, IconData icon) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 480, // Ajuste conforme necessário para o layout desejado
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    ],
  );
}