import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String productId;
  //Areas
  String productName;
  String userName;
  String address;
  int price;
  int quantity;
  OrderModel(
      {required this.productId,
      required this.productName,
      required this.userName,
      required this.price,
      required this.quantity,
      required this.address});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'productId': productId,

        'productName': productName,

        'price': price,

        'userName': userName,

        //Name
        'address': productName,
        "quantity": quantity
      };

  ///
  static OrderModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return OrderModel(
      quantity: snapshot['quantity'],
      userName: snapshot['userName'],
      price: snapshot['price'],
      productName: snapshot['productName'],
      productId: snapshot['productId'],
      address: snapshot['address'],
    );
  }
}
