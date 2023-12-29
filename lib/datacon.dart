// your_project_name.dart
import 'package:flutter/material.dart';
import 'package:telas_datacon_teste/menu_datacon.dart';
import 'package:telas_datacon_teste/planejamento_pesquisa.dart';
import 'estrategia_pesquisa.dart';
import 'homescreen.dart';

class DataCon extends StatefulWidget {
  const DataCon({Key? key}) : super(key: key);

  @override
  _DataConState createState() => _DataConState();
}

class _DataConState extends State<DataCon> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataCon',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.purple, // Cor de fundo do BottomNavigationBar
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          elevation: 0, // Remove a sombra
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text('DataCon'),
        ),
        drawer: const MenuDataCon(),
        body: _buildBody(),
        // body: _buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Problemas'),
            BottomNavigationBarItem(icon: Icon(Icons.reset_tv_outlined), label: 'Estratégias'),
            BottomNavigationBarItem(icon: Icon(Icons.library_books_outlined), label: 'Compiladores'),
            BottomNavigationBarItem(icon: Icon(Icons.insert_chart_outlined), label: 'Explorar'),
            BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: 'Resultados'),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            _onBottomNavigationBarItemTapped(index);
          },
        ),
      ),
    );
  }

  void _onBottomNavigationBarItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return PlanejamentoPesquisaScreen();
      case 1:
        return EstrategiaPesquisaScreen();
      case 2:
        return const HomeScreen(title: 'Compiladores');
     default:
        return Container();
    }
  }

  // Widget _buildBody() {
  //   return const HomeScreen(title: 'DataCon');
  // }
}

