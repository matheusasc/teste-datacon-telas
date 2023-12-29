// other_tab_screen.dart
import 'package:flutter/material.dart';

class CriteriosExclusao extends StatefulWidget {
  const CriteriosExclusao({Key? key}) : super(key: key);

  @override
  _CriteriosExclusaoState createState() => _CriteriosExclusaoState();
}

class _CriteriosExclusaoState extends State<CriteriosExclusao> {
  List<String> items = List.generate(5, (index) => 'Outro Item $index');
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
              ? const Center(
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
