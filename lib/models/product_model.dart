import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String uuid;
  String productName;
  String productDescription;
  String productCategory;
  String photoURL;
  String productSubCategory;
  int productPrice;

  ProductModel(
      {required this.uuid,
      required this.productName,
      required this.productDescription,
      required this.photoURL,
      required this.productPrice,
      required this.productSubCategory,
      required this.productCategory});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'productCategory': productCategory,
        'uuid': uuid,
        'productName': productName,
        'productDescription': productDescription,
        'productPrice': productPrice,
        'productSubCategory': productSubCategory,
        'photoURL': photoURL
      };

  ///
  static ProductModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return ProductModel(
      productCategory: snapshot['productCategory'],
      uuid: snapshot['uuid'],
      productName: snapshot['productName'],
      photoURL: snapshot['photoURL'],
      productDescription: snapshot['productDescription'],
      productPrice: snapshot['productPrice'],
      productSubCategory: snapshot['productSubCategory'],
    );
  }
}
