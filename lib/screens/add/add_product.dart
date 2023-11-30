import 'dart:typed_data';

import 'package:d_man_admin/screens/main/main_dashboard.dart';
import 'package:d_man_admin/services/firebase_methods.dart';
import 'package:d_man_admin/utils/app_styles.dart';
import 'package:d_man_admin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Uint8List? _image;
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();
  TextEditingController _productCategoryController = TextEditingController();
  TextEditingController _productSubCategoryController = TextEditingController();
  TextEditingController _productDescriptionController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Add Product",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: AlignmentDirectional.center,
          child: Container(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 59, backgroundImage: MemoryImage(_image!))
                      : IconButton(
                          onPressed: selectImage,
                          icon: Icon(
                            Icons.add,
                            size: 35,
                          )),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _productNameController,
                    decoration: InputDecoration(
                      focusedBorder: AppStyles.focusedBorder,
                      disabledBorder: AppStyles.focusBorder,
                      enabledBorder: AppStyles.focusBorder,
                      errorBorder: AppStyles.focusErrorBorder,
                      focusedErrorBorder: AppStyles.focusErrorBorder,
                      hintText: "Product Name",
                      alignLabelWithHint: false,
                      filled: true,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    maxLines: 4,
                    controller: _productDescriptionController,
                    decoration: InputDecoration(
                      focusedBorder: AppStyles.focusedBorder,
                      disabledBorder: AppStyles.focusBorder,
                      enabledBorder: AppStyles.focusBorder,
                      errorBorder: AppStyles.focusErrorBorder,
                      focusedErrorBorder: AppStyles.focusErrorBorder,
                      hintText: "Product Description",
                      alignLabelWithHint: false,
                      filled: true,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _productPriceController,
                    decoration: InputDecoration(
                      focusedBorder: AppStyles.focusedBorder,
                      disabledBorder: AppStyles.focusBorder,
                      enabledBorder: AppStyles.focusBorder,
                      errorBorder: AppStyles.focusErrorBorder,
                      focusedErrorBorder: AppStyles.focusErrorBorder,
                      hintText: "Product Price",
                      alignLabelWithHint: false,
                      filled: true,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _productCategoryController,
                    decoration: InputDecoration(
                      focusedBorder: AppStyles.focusedBorder,
                      disabledBorder: AppStyles.focusBorder,
                      enabledBorder: AppStyles.focusBorder,
                      errorBorder: AppStyles.focusErrorBorder,
                      focusedErrorBorder: AppStyles.focusErrorBorder,
                      hintText: "Product Category",
                      alignLabelWithHint: false,
                      filled: true,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _productSubCategoryController,
                    decoration: InputDecoration(
                      focusedBorder: AppStyles.focusedBorder,
                      disabledBorder: AppStyles.focusBorder,
                      enabledBorder: AppStyles.focusBorder,
                      errorBorder: AppStyles.focusErrorBorder,
                      focusedErrorBorder: AppStyles.focusErrorBorder,
                      hintText: "Product Sub Category",
                      alignLabelWithHint: false,
                      filled: true,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            if (_productNameController.text.isEmpty ||
                                _productCategoryController.text.isEmpty ||
                                _productSubCategoryController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("All Fields are required")));
                            } else {
                              setState(() {
                                _isLoading = true;
                              });
                              String
                                  rse =
                                  await FirebaseMethods().createProduct(
                                      productName: _productNameController.text,
                                      productDescription:
                                          _productDescriptionController.text,
                                      productCategory:
                                          _productCategoryController.text,
                                      productSubCategory:
                                          _productCategoryController.text,
                                      price: int.parse(
                                          _productPriceController.text),
                                      file: _image!);
                              setState(() {
                                _isLoading = false;
                              });
                              if (rse != 'sucess') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(rse)));
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => MainDashboard()));
                              }
                            }
                          },
                          child: Text(
                            "Add Product",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(500, 50),
                              backgroundColor: Colors.green),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }
}
