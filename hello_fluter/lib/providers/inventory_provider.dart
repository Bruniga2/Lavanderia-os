import 'package:flutter/foundation.dart';
import '../models/clothing_item.dart'; // Ajusta el path según tu estructura de carpetas
import '../services/inventory_service.dart'; // Ajusta el path según tu estructura de carpetas

class InventoryProvider with ChangeNotifier {
  final InventoryService _inventoryService = InventoryService();
  List<ClothingItem> _inventory = [];

  List<ClothingItem> get inventory => _inventory;

  Future<void> loadInventory() async {
    _inventory = await _inventoryService.getInventory();
    notifyListeners();
  }

  void addCleanClothes(String type, int quantity) {
    _inventoryService.addCleanClothes(type, quantity);
    loadInventory();
  }

  void addDirtyClothes(String type, int quantity) {
    _inventoryService.addDirtyClothes(type, quantity);
    loadInventory();
  }
}
