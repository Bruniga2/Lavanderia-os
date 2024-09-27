import 'package:flutter/material.dart';
import '../services/inventory_service.dart';

class CleanClothesPage extends StatefulWidget {
  @override
  _CleanClothesPageState createState() => _CleanClothesPageState();
}

class _CleanClothesPageState extends State<CleanClothesPage> {
  final InventoryService _inventoryService = InventoryService();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ropa Limpia')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _typeController,
              decoration: InputDecoration(labelText: 'Tipo de Ropa'),
            ),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Cantidad'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Agregar Ropa Limpia'),
              onPressed: () {
                _inventoryService.addCleanClothes(
                  _typeController.text,
                  int.parse(_quantityController.text),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ropa limpia agregada al inventario')),
                );
                _typeController.clear();
                _quantityController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
