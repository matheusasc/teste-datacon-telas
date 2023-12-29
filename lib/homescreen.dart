// home_screen.dart
import 'package:flutter/material.dart';
import 'criterios/criterios_exclusao.dart';
import 'criterios/criterios_inclusao.dart';
import 'menu_datacon.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Widget _buildDrawer() {
  //   return const MenuDataCon(); // Sem lógica condicional, sempre exibe o drawer
  // }
  //
  // Widget _buildBody() {
  //   return ResponsiveBuilder(
  //     builder: (context, sizingInformation) {
  //       if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
  //         // Retorna BottomNavigationScreen para dispositivos móveis
  //         return BottomNavigationScreen();
  //       } else {
  //         // Retorna MenuDataCon para outros tamanhos de tela
  //         return const SizedBox(); // Um widget vazio para ocupar o espaço, mas não mostrar nada
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Critérios de Inclusão'),
              Tab(text: 'Critérios de Exclusão'),
            ],
          ),
        ),
        // drawer: _buildDrawer(),
        // drawer: MenuDataCon(),
        body: TabBarView(
          children: [
            CriteriosInclusao(),
            CriteriosExclusao(),
          ],
        ),
        // bottomNavigationBar: _buildBody(),
        // bottomNavigationBar: BottomNavigationScreen(),
      ),
    );
  }
}