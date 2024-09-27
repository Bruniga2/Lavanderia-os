import 'package:flutter/material.dart';
import '../services/inventory_service.dart';
import '../models/clothing_item.dart';

class InventoryReportPage extends StatelessWidget {
  final InventoryService _inventoryService = InventoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inventory Report')),
      body: FutureBuilder<List<ClothingItem>>(
        future: _inventoryService.getInventory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No inventory data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ClothingItem item = snapshot.data![index];
                return ListTile(
                  title: Text(item.type),
                  subtitle: Text('Clean: ${item.cleanQuantity}, Dirty: ${item.dirtyQuantity}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
