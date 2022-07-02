import 'dart:io';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/core/view_model/home_view_model.dart';
import 'package:untitled/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:untitled/view/Widget/custom_Button.dart';

// ignore: must_be_immutable
class EditProductWidget extends StatefulWidget {
  EditProductWidget({Key? key, this.productModel}) : super(key: key);
  ProductModel? productModel;

  @override
  _EditProductWidget createState() => _EditProductWidget();
}

class _EditProductWidget extends State<EditProductWidget> {
  TextEditingController checkDescriptionController = TextEditingController();
  TextEditingController checkPriceController = TextEditingController();
  TextEditingController checkNameController = TextEditingController();
  String checkDescription = "";
  bool isLoading = false;
  String checkPrice = "";
  String checkName = "";

  @override
  void initState() {
    super.initState();
    if (mounted) {
      checkPriceController.text = widget.productModel!.price.toString();
      checkDescriptionController.text = widget.productModel!.description.toString();
      checkNameController.text = widget.productModel!.name.toString();
      checkPrice = widget.productModel!.price.toString();
      checkName = widget.productModel!.name.toString();
      checkDescription = widget.productModel!.description.toString();
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
                        widget.productModel!.image.toString(),
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
                onPressed: () {},
                txt: "DELETE THIS PRODUCT",
                color: Colors.red,
              ),
            ],
          ),
        ),
      );
}
