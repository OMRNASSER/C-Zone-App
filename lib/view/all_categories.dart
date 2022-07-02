import 'package:untitled/core/view_model/home_view_model.dart';
import 'package:untitled/model/product_model.dart';
import 'package:untitled/view/add_category.dart';
import 'package:untitled/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/edit_category.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class AllCategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const Expanded(
              child: Text(
                'Categories',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
            const SizedBox(width: 10.0),
            IconButton(
              splashRadius: 25.0,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddCategoryWidget())),
              icon: const Icon(
                Icons.add,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<HomeViewModel>(
          init: Get.find<HomeViewModel>(),
          builder: (controller) {
            List<ProductModel> temp = [];
            temp = controller.productModel;

            return controller.loading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : Scaffold(
                    body: ListView(padding: const EdgeInsets.all(20), children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade200,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search something',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          iconColor: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    temp.isEmpty
                        ? Container(
                            alignment: AlignmentDirectional.center,
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
                                            Colors.green,
                                            Colors.greenAccent.withOpacity(0.1),
                                          ])),
                                      child: const Icon(
                                        Icons.layers,
                                        color: Colors.white,
                                        size: 70,
                                      ),
                                    ),
                                    Positioned(
                                      right: -30,
                                      bottom: -50,
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(150),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: -20,
                                      top: -50,
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.15),
                                          borderRadius: BorderRadius.circular(150),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Opacity(
                                  opacity: 0.4,
                                  child: Text(
                                    'No item found in this category',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.headline2!.merge(
                                          const TextStyle(
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : GetBuilder<HomeViewModel>(
                            builder: (controller) => Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: List.generate(controller.categoryModel.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditCategoryWidget(categoryModel: controller.categoryModel.elementAt(index),)));
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
                                        color: primaryColor,
                                        width: 0.5,
                                      ),
                                    ),
                                    height: 80,
                                    width: 80,
                                  ),
                                );
                              }),
                            ),
                          ),
                  ]));
          }),
    );
  }
}
