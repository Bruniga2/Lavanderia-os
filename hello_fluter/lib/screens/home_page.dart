import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/clean'),
            child: Text('Ir a Ropa Limpia'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/dirty'),
            child: Text('Ir a Ropa Sucia'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/report'),
            child: Text('Ver Reporte de Inventario'),
          ),
        ],
      ),
    );
  }
}
