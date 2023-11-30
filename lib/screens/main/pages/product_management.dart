import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_man_admin/screens/add/add_product.dart';
import 'package:d_man_admin/screens/add/product_detail.dart';
import 'package:flutter/material.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => AddProduct()));
          },
          child: Icon(Icons.add),
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("products").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    "No Product Found yet",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StreamBuilder<Object>(
                      stream: FirebaseFirestore.instance
                          .collection("products")
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        final Map<String, dynamic> data =
                            documents[index].data() as Map<String, dynamic>;
                        return Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.network(
                                  data["photoURL"].toString(),
                                  height: 110,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => ProductDetail(
                                                photoUrl:
                                                    data["photoURL"].toString(),
                                                price: data['productPrice'],
                                                productCategory:
                                                    data['productCategory'],
                                                productDescription:
                                                    data['productDescription'],
                                                productName:
                                                    data['productName'],
                                                productSubCategoty:
                                                    data['productSubCategory'],
                                                uuid: data['uuid'])));
                                  },
                                  child: Text(
                                    "View Details",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  });
            }));
  }
}
// StreamBuilder(
//           stream: FirebaseFirestore.instance.collection("products").snapshots(),
//           builder: (context, snapshot) {
//             return GridView.builder(

//               itemBuilder: (context, i) => 

//           }),