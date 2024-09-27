import 'package:cloud_firestore/cloud_firestore.dart';
   import '../models/clothing_item.dart';

   class InventoryService {
     final CollectionReference _inventoryCollection =
         FirebaseFirestore.instance.collection('inventory');

     Future<void> addCleanClothes(String type, int quantity) async {
       DocumentSnapshot doc = await _inventoryCollection.doc(type).get();
       if (doc.exists) {
         await _inventoryCollection.doc(type).update({
           'cleanQuantity': FieldValue.increment(quantity),
         });
       } else {
         await _inventoryCollection.doc(type).set({
           'type': type,
           'cleanQuantity': quantity,
           'dirtyQuantity': 0,
         });
       }
     }

     Future<void> addDirtyClothes(String type, int quantity) async {
       DocumentSnapshot doc = await _inventoryCollection.doc(type).get();
       if (doc.exists) {
         await _inventoryCollection.doc(type).update({
           'dirtyQuantity': FieldValue.increment(quantity),
         });
       } else {
         await _inventoryCollection.doc(type).set({
           'type': type,
           'cleanQuantity': 0,
           'dirtyQuantity': quantity,
         });
       }
     }

     Future<List<ClothingItem>> getInventory() async {
       QuerySnapshot snapshot = await _inventoryCollection.get();
       return snapshot.docs.map((doc) {
         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
         return ClothingItem(
           type: data['type'],
           cleanQuantity: data['cleanQuantity'],
           dirtyQuantity: data['dirtyQuantity'],
         );
       }).toList();
     }
   }