import 'package:flutter/material.dart';
import '../view/main_Drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filter'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
