import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_man_admin/models/product_model.dart';
import 'package:d_man_admin/services/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirebaseMethods {
  var uuid = Uuid().v4();
  Future<String> createProduct(
      {required String productName,
      required int price,
      required String productDescription,
      required String productCategory,
      required String productSubCategory,
      required Uint8List file}) async {
    String res = 'Some error occured';
    try {
      String photoURL = await StorageMethods()
          .uploadImageToStorage('ProfilePics', file, false);
      //Add User to the database with modal
      ProductModel userModel = ProductModel(
          productSubCategory: productSubCategory,
          productCategory: productCategory,
          productDescription: productDescription,
          productName: productName,
          productPrice: price,
          uuid: uuid,
          photoURL: photoURL);
      await FirebaseFirestore.instance
          .collection('products')
          .doc(uuid)
          .set(userModel.toJson());
      res = 'sucess';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
