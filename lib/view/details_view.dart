import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled/view/Widget/custom_Button.dart';
import 'package:untitled/model/cart_product_model.dart';
import 'package:untitled/view/Widget/CustomText.dart';
import 'package:untitled/model/product_model.dart';
import '../core/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constant.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  ProductModel model;
  DetailsView({required this.model});
  int _current = 0;
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
            Expanded(
              child: Text(
                model.name.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: model.imagesList!.length,
              options: CarouselOptions(
                onPageChanged: (int index, CarouselPageChangedReason changedReason) => _current = index,
                viewportFraction: 1.0,
                height: MediaQuery.of(context).size.height / 2,
              ),
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                String string = model.imagesList!.elementAt(itemIndex);
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      margin: const EdgeInsets.only(right: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                         image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            string,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      left: 10.0,
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.deepOrange, width: 1.0),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                model.image.toString(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Wrap(
                spacing: 4.0,
                runSpacing: 4.0,
                children: model.imagesList!.map((String e) {
                  return Container(
                    width: 26.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      color: _current == model.imagesList!.indexOf(e)
                          ? Theme.of(context).colorScheme.secondary.withOpacity(0.8)
                          : Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Stack(
            //   alignment: Alignment.centerLeft,
            //   children: [
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width,
            //       height: 270,
            //       child: Image.network(
            //         model.image.toString(),
            //         fit: BoxFit.fill,
            //       ),
            //     ),

            //     IconButton(
            //       onPressed: () {
            //         Get.offAll(ControlView());
            //       },
            //       icon: const Icon(Icons.arrow_back_ios),
            //       alignment: Alignment.centerLeft,
            //     ),
            //     const SizedBox(width: 200),

            //     // Align(
            //     //   alignment: Alignment.centerRight,
            //     //   child: IconButton(onPressed: (){
            //     //
            //     //   }, icon:Icon(Icons.stars,size:35 ,),
            //     //     alignment: Alignment.centerRight,
            //     //   ),
            //     // ),
            //   ],
            // ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  CustomText(
                    txt: model.name.toString(),
                    fontSize: 26,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CustomText(
                              txt: 'Size',
                            ),
                            CustomText(
                              txt: model.sized.toString(),
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .45,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CustomText(
                              txt: 'Colour',
                            ),
                            Container(
                              width: 35,
                              height: 20,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade300), color: model.color),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const CustomText(
                        txt: 'Details',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomText(
                      txt: model.description.toString(),
                      fontSize: 14,
                      height: 2.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              txt: 'PRICE',
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                            CustomText(
                              txt: 'EGP ' + model.price.toString(),
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        GetBuilder<CartViewModel>(
                          init: Get.find<CartViewModel>(),
                          builder: (controller) => Container(
                            padding: const EdgeInsets.all(20.0),
                            width: 220,
                            height: 100,
                            child: CustomButton(
                              txt: 'ADD',
                              color: primaryColor,
                              onPressed: () => controller.addProduct(
                                CartProductModel(
                                  name: model.name,
                                  image: model.image,
                                  price: model.price,
                                  quantity: 1,
                                  productId: model.productId,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
