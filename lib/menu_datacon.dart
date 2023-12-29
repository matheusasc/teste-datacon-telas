// app_drawer.dart
import 'package:flutter/material.dart';

class MenuDataCon extends StatelessWidget {
  const MenuDataCon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black26,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          const DrawerItem(icon: Icons.search, title: 'Problemas'),
          const DrawerItem(icon: Icons.reset_tv_outlined, title: 'Estratégias'),
          const DrawerItem(icon: Icons.library_books_outlined, title: 'Compiladores'),
          const DrawerItem(icon: Icons.insert_chart_outlined, title: 'Explorar'),
          const DrawerItem(icon: Icons.article_outlined, title: 'Resultados'),
          const Divider(),
          DrawerItem(icon: Icons.exit_to_app, title: 'Sair', onTap: () {
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.icon, required this.title, this.onTap})
      : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap != null ? () => onTap!() : null,
      ),
    );
  }
}


class BottomNavigationScreen extends StatefulWidget {
  @override
  const BottomNavigationScreen({Key? key}) : super(key: key);

  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black26, // Cor de fundo desejada
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.purple, // Cor de fundo do BottomNavigationBar
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          elevation: 0, // Remove a sombra
        ),
      ),
      home: Scaffold(
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
            setState(() {
              _currentIndex = index;
            });
            // Adicione aqui a lógica para lidar com a navegação do BottomNavigationBar
          },
        ),
      ),
    );
  }
}