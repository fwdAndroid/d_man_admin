import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  var uuid = Uuid().v4();
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  ///TO GET USER ID ///

  ///Adding Image to Firebase Storage/
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    Reference reference = firebaseStorage.ref().child(childName).child(uuid);

    // TO COnsider whether its profile or post Omage
    if (isPost) {
      String id = Uuid().v1();
      reference = reference.child(id);
    }
    UploadTask uploadTask = reference.putData(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    return downloadURL;
  }
}
