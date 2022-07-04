import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:untitled/core/view_model/home_view_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled/view/Widget/custom_Button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/model/product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/Constant.dart';
import 'package:flutter/material.dart';
import 'dart:io';

// ignore: must_be_immutable
class EditProductWidget extends StatefulWidget {
  EditProductWidget({Key? key, this.productModel}) : super(key: key);
  ProductModel? productModel;

  @override
  _EditProductWidget createState() => _EditProductWidget();
}

class _EditProductWidget extends State<EditProductWidget> {
  final CollectionReference _productCollectionsRef = FirebaseFirestore.instance.collection('Products');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  TextEditingController checkDescriptionController = TextEditingController();
  TextEditingController checkSizedController = TextEditingController();
  TextEditingController checkBrandController = TextEditingController();
  TextEditingController checkPriceController = TextEditingController();
  TextEditingController checkNameController = TextEditingController();
  String checkDescription = "";
  String currentCategory = '';
  String checkBrand = "";
  String checkSized = "";
  bool isLoading = false;
  String checkPrice = "";
  String checkName = "";
  String imageUrl = '';
  File? checkPicture;

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              color: Colors.white,
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Gallery'),
                      onTap: () async {
                        ImagePicker picker = ImagePicker();
                        XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
                        checkPicture = File(xFile!.path);
                        uploadFile(File(xFile.path));
                        setState(() {});
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () async {
                      ImagePicker picker = ImagePicker();
                      XFile? xFile = await picker.pickImage(source: ImageSource.camera);
                      checkPicture = File(xFile!.path);
                      uploadFile(File(xFile.path));
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future uploadFile(file) async {
    setState(() => isLoading = !isLoading);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(file.path + DateTime.now().toString());
    await ref.putFile(file);
    imageUrl = await ref.getDownloadURL();
    setState(() => isLoading = !isLoading);
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      checkPriceController.text = widget.productModel!.price.toString();
      checkDescriptionController.text = widget.productModel!.description.toString();
      checkNameController.text = widget.productModel!.name.toString();
      checkBrandController.text = widget.productModel!.brand.toString();
      checkSizedController.text = widget.productModel!.sized.toString();
      checkPrice = widget.productModel!.price.toString();
      checkName = widget.productModel!.name.toString();
      checkSized = widget.productModel!.sized.toString();
      checkBrand = widget.productModel!.brand.toString();
      checkDescription = widget.productModel!.description.toString();
      imageUrl = widget.productModel!.image.toString();
      currentCategory = widget.productModel!.categoryId.toString();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Row(
            children: [
              IconButton(
                splashRadius: 25.0,
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 20.0,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  widget.productModel!.name.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              const SizedBox(width: 10.0),
              (isLoading)
                  ? CircularProgressIndicator(
                      valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
                      backgroundColor: Colors.grey[200],
                      strokeWidth: 1.0,
                    )
                  : IconButton(
                      splashRadius: 25.0,
                      onPressed: (currentCategory.isEmpty || checkName.isEmpty || checkDescription.isEmpty || checkPrice.isEmpty)
                          ? null
                          : () {
                              setState(() => isLoading = !isLoading);

                              _productCollectionsRef.doc(widget.productModel!.productId).update({
                                'name': checkName,
                                'price': checkPrice,
                                'description': checkDescription,
                                'image': imageUrl,
                                'brand': checkBrand,
                                'sized': checkSized,
                                'imagesList': [imageUrl],
                                'categoryId': currentCategory,
                                'productId': widget.productModel!.productId,
                              }).then((value) {
                                Navigator.of(context).pop();
                                setState(() => isLoading = !isLoading);
                                // ADD GETX RUN
                              }).catchError((onError) => setState(() => isLoading = !isLoading));
                            },
                      icon: const Icon(
                        Icons.check,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'PHOTO',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.0),
              ),
              const SizedBox(height: 10.0),
              InkWell(
                onTap: () => _showPicker(context),
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: (checkPicture == null) ? Image.network(widget.productModel!.image.toString()) : Image.file(checkPicture!),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'NAME',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.0),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.grey[200]),
                child: TextField(
                  controller: checkNameController,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (value) => setState(() => checkName = value),
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                    border: const UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'SIZED',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.0),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.grey[200]),
                child: TextField(
                  controller: checkSizedController,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (value) => setState(() => checkSized = value),
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Size",
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                    border: const UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'BRAND',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.0),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.grey[200]),
                child: TextField(
                  controller: checkBrandController,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (value) => setState(() => checkBrand = value),
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Brand",
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                    border: const UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'PICE',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.0),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.grey[200]),
                child: TextField(
                  controller: checkPriceController,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (value) => setState(() => checkPrice = value),
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Price",
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                    border: const UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'SHORT DESCRIPTION',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.0),
              ),
              const SizedBox(height: 10.0),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.grey[200]),
                  child: TextField(
                      controller: checkDescriptionController,
                      cursorColor: Theme.of(context).colorScheme.secondary,
                      onChanged: (value) => setState(() => checkDescription = value),
                      style: Theme.of(context).textTheme.bodyText1,
                      keyboardType: TextInputType.text,
                      maxLines: 2,
                      decoration: InputDecoration(
                          hintText: "Description",
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          border: const UnderlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none)))),
              const SizedBox(height: 10.0),
              const Text(
                'CATEGORY',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.0),
              ),
              const SizedBox(height: 10.0),
              GetBuilder<HomeViewModel>(
                builder: (controller) => Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: List.generate(controller.categoryModel.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        controller.categoryModel.map((e) => e.selected = false).toList();
                        controller.categoryModel.elementAt(index).selected = true;
                        currentCategory = controller.categoryModel.elementAt(index).categoryId.toString();
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100,
                          image: DecorationImage(
                            image: NetworkImage(
                              controller.categoryModel[index].image.toString(),
                            ),
                          ),
                          border: Border.all(
                            color: controller.categoryModel.elementAt(index).selected == true ? Colors.deepOrange : Colors.black,
                            width: 1.5,
                          ),
                        ),
                        height: 50,
                        width: 50,
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                onPressed: () {
                  _productCollectionsRef.doc(widget.productModel!.productId).delete().then((value) {
                    Navigator.of(context).pop();
                    setState(() => isLoading = !isLoading);
                    // ADD GETX RUN
                  }).catchError((onError) => setState(() => isLoading = !isLoading));
                },
                txt: "DELETE THIS PRODUCT",
                color: Colors.red,
              ),
            ],
          ),
        ),
      );
}
