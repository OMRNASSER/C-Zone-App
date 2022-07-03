import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/view/Widget/custom_Button.dart';
import 'package:untitled/model/category_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

// ignore: must_be_immutable
class EditCategoryWidget extends StatefulWidget {
  EditCategoryWidget({Key? key, this.categoryModel}) : super(key: key);
  CategoryModel? categoryModel;

  @override
  _EditCategoryWidget createState() => _EditCategoryWidget();
}

class _EditCategoryWidget extends State<EditCategoryWidget> {
  final CollectionReference _categoryCollectioRef = FirebaseFirestore.instance.collection('Category');
  TextEditingController checkNameController = TextEditingController();
  bool isLoading = false;
  String checkName = "";
  File? checkPicture;
  String imageUrl = '';
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
      checkNameController.text = widget.categoryModel!.name.toString();
      checkName = widget.categoryModel!.name.toString();
      imageUrl = widget.categoryModel!.image.toString();
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
                  widget.categoryModel!.name.toString(),
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
                      onPressed: (checkName.isEmpty)
                          ? null
                          : () {
                              setState(() => isLoading = !isLoading);

                              _categoryCollectioRef.doc(widget.categoryModel!.categoryId).update({
                                'name': checkName,
                                'Image': imageUrl,
                                'categoryId': widget.categoryModel!.categoryId,
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
                  child: (checkPicture == null) ? Image.network(widget.categoryModel!.image.toString()) : Image.file(checkPicture!),
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
              const SizedBox(height: 20.0),
              CustomButton(
                onPressed: () {
                  _categoryCollectioRef.doc(widget.categoryModel!.categoryId).delete().then((value) {
                    Navigator.of(context).pop();
                    setState(() => isLoading = !isLoading);
                    // ADD GETX RUN
                  }).catchError((onError) => setState(() => isLoading = !isLoading));
                },
                txt: "DELETE THIS CATEGORY",
                color: Colors.red,
              ),
            ],
          ),
        ),
      );
}
