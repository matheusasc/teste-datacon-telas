import 'package:flutter/material.dart';

class EstrategiaPesquisaScreen extends StatefulWidget {
  @override
  _EstrategiaPesquisaScreenState createState() => _EstrategiaPesquisaScreenState();
}

class _EstrategiaPesquisaScreenState extends State<EstrategiaPesquisaScreen> {
  // Lista fictícia de itens
  List<String> itemList = List.generate(20, (index) => 'Item $index');
  List<String> filteredItemList = [];

  TextEditingController _descritoresController = TextEditingController();
  TextEditingController _stringBuscaController = TextEditingController();
  TextEditingController _observacoesController = TextEditingController();
  TextEditingController _filtroTemporalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItemList = itemList;
    _descritoresController.addListener(() {
      filterItems(_descritoresController.text);
    });
    _stringBuscaController.addListener(() {
      filterItems(_stringBuscaController.text);
    });
    _observacoesController.addListener(() {
      filterItems(_observacoesController.text);
    });
    _filtroTemporalController.addListener(() {
      filterItems(_filtroTemporalController.text);
    });
  }

  void filterItems(String query) {
    setState(() {
      filteredItemList = itemList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estratégia de Pesquisa"),
        backgroundColor: Colors.black26, // Cor de fundo da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(70.0, 16.0, 16.0, 16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  buildInput("Descritores", "Digite os descritores...", _descritoresController, Icons.description),
                  SizedBox(height: 20),
                  buildInput("String de Busca", "Digite a string de busca...", _stringBuscaController, Icons.search),
                  SizedBox(height: 20),
                  buildInput("Observações", "Digite a observação...", _observacoesController, Icons.notes),
                  SizedBox(height: 20),
                  buildInput("Filtro temporal", "Digite o filtro temporal...", _filtroTemporalController, Icons.access_time),
                ],
              ),
            ),
            VerticalDivider(width: 1, color: Colors.grey), // Adiciona uma divisória vertical
            SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: ListaItens(itemList: filteredItemList),
            ),
          ],
        ),
      ),
    );
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
            maxWidth: 300, // Ajuste conforme necessário para o layout desejado
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Icon(icon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ListaItens extends StatelessWidget {
  final List<String> itemList;

  ListaItens({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(itemList[index]),
                subtitle: Text('Descrição do ${itemList[index]}'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Adicione a lógica para lidar com o toque no item, se necessário
                },
              ),
            ),
          );
        },
    );
  }
}