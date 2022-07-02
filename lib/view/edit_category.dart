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
  TextEditingController checkNameController = TextEditingController();
  bool isLoading = false;
  String checkName = "";

  @override
  void initState() {
    super.initState();
    if (mounted) {
      checkNameController.text = widget.categoryModel!.name.toString();
      checkName = widget.categoryModel!.name.toString();
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
              IconButton(
                splashRadius: 25.0,
                onPressed: () => Navigator.of(context).pop(),
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
                onTap: () async {
                  ImagePicker picker = ImagePicker();
                  XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
                  File file = File(xFile!.path);
                  // UPLOAD THE FILE TO FIREBASE
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        widget.categoryModel!.image.toString(),
                      ),
                    ),
                  ),
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
                onPressed: () {},
                txt: "DELETE THIS CATEGORY",
                color: Colors.red,
              ),
            ],
          ),
        ),
      );
}
