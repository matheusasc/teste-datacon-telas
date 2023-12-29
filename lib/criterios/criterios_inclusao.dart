// criterios_inclusao.dart
import 'package:flutter/material.dart';

class CriteriosInclusao extends StatefulWidget {
  const CriteriosInclusao({Key? key}) : super(key: key);

  @override
  _CriteriosInclusaoState createState() => _CriteriosInclusaoState();
}

class _CriteriosInclusaoState extends State<CriteriosInclusao> {
  List<String> items = List.generate(5, (index) => 'Item $index');
  TextEditingController _filterController = TextEditingController();
  List<String> filteredItems = [];

  @override
  initState() {
    super.initState();
    filteredItems = items;
    _filterController.addListener(() {
      filterItems(_filterController.text);
    });
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: SizedBox(
            width: 520.0,
            child: TextField(
              controller: _filterController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                labelText: 'Pesquisar',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),

          ),
        ),
        Expanded(
          child: filteredItems.isEmpty
              ? Center(
            child: Text('Nenhum item correspondente.'),
          )
              : ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(filteredItems[index]),
                    subtitle: Text('Descrição do ${filteredItems[index]}'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
