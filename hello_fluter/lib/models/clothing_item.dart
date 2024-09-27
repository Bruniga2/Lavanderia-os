class ClothingItem {
  final String type;
  int cleanQuantity;
  int dirtyQuantity;

  ClothingItem({
    required this.type,
    this.cleanQuantity = 0,
    this.dirtyQuantity = 0,
  });
}