import 'package:flutter/material.dart';
import '../services/inventory_service.dart';

class DirtyClothesPage extends StatefulWidget {
  @override
  _DirtyClothesPageState createState() => _DirtyClothesPageState();
}

class _DirtyClothesPageState extends State<DirtyClothesPage> {
  final InventoryService _inventoryService = InventoryService();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ropa Sucia')),
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
              child: Text('Agregar Ropa Sucia'),
              onPressed: () {
                _inventoryService.addDirtyClothes(
                  _typeController.text,
                  int.parse(_quantityController.text),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ropa sucia agregada al inventario')),
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
