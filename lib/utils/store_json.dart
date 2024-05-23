import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/order.dart';
import '../model/user_model.dart';

Future<void> saveOrder(String userId, Orders order) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference ordersRef = firestore.collection('user').doc(userId).collection('orders');

  try {
    await ordersRef.doc(order.id).set(order.toJson());
    print("Order saved successfully!");
  } catch (e) {
    print("Failed to save order: $e");
  }
}

Future<void> updateOrder(String userId, Orders order) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference ordersRef = firestore.collection('user').doc(userId).collection('orders');

  try {
    await ordersRef.doc(order.id).update(order.toJson());
    print("Order updated successfully!");
  } catch (e) {
    print("Failed to update order: $e");
  }
}

Future<void> deleteOrder(String userId, Orders order) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference ordersRef = firestore.collection('user').doc(userId).collection('orders');

  try {
    await ordersRef.doc(order.id).delete();
    print("Order deleted successfully!");
  } catch (e) {
    print("Failed to delete order: $e");
  }
}

Future<void> saveCheckoutOrder(String userId, List<Orders> orders) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference checkoutRef = firestore.collection('user').doc(userId).collection('checkout');
  String timeNow = DateTime.now().toIso8601String(); // Use ISO 8601 format for better readability

  try {
    // Create a new checkout document with a unique ID
    DocumentReference newCheckoutDoc = checkoutRef.doc(timeNow);
    // Set some initial data in the parent document
    await newCheckoutDoc.set({'timestamp': Timestamp.now()});

    // Add each order to the orders subcollection of the checkout document
    for (var order in orders) {
      await newCheckoutDoc.collection('orders').doc(order.id).set({
        'id': order.id,
        'name': order.name,
        'quantity': order.quantity,
        'image': order.image,
        'date': order.date,
        'amount': order.amount,
        'vendor': order.vendor,
        'status': "পেন্ডিং", // Assuming 'status' is initialized here
      });
    }
    print("Orders saved successfully!");
  } catch (e) {
    print("Failed to save orders: $e");
  }
}



Future<void> saveCheckoutOrderInVendor(String userId, List<Orders> orders) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Usermodel user = Usermodel();

  try {
    for (var order in orders) {
      QuerySnapshot vendorSnapshot = await firestore.collection('vendor').where('shop name', isEqualTo: order.vendor).get();

      if (vendorSnapshot.docs.isNotEmpty) {
        DocumentReference vendorDoc = vendorSnapshot.docs.first.reference;


        await vendorDoc.collection('orders').doc(order.id).set({
          ...order.toJson(),
          'userName': user.getName(),
          'userPhoneNumber': user.getPhone(),
        });
      } else {
        print("Vendor not found: ${order.vendor}");
      }
    }
    for (var order in orders) {
      await deleteOrder(userId, order);
    }
    print("Orders saved successfully!");
  } catch (e) {
    print("Failed to save orders: $e");
  }
}


