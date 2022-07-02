import 'package:untitled/core/view_model/cart_view_model.dart';
import 'package:untitled/view/Widget/custom_Button.dart';
import 'package:untitled/view/checkout_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Constant.dart';
import "package:flutter/material.dart";
import 'Widget/CustomText.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<CartViewModel>(
        init: Get.find<CartViewModel>(),
        builder: (controller) => controller.cartProductModel.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/cartEmpty.svg",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20.0),
                  const CustomText(
                    txt: "Cart Empty",
                    fontSize: 30,
                    alignment: Alignment.topCenter,
                    color: Colors.grey,
                  )
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(12.0),
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.horizontal,
                            confirmDismiss: (DismissDirection dismissDirection) {
                              if (DismissDirection.startToEnd == dismissDirection) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Yay! your item is mark as favorite!')));
                              } else {
                                controller.removeProduct(controller.cartProductModel.elementAt(index));
                                controller.decreaseQuantity(controller.cartProductModel[index].quantity);
                              }
                              return Future.value(dismissDirection == DismissDirection.endToStart);
                            },
                            secondaryBackground: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              alignment: Alignment.centerRight,
                              color: Colors.red,
                              child: const Icon(Icons.delete, size: 20.0, color: Colors.white),
                            ),
                            background: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              alignment: Alignment.centerLeft,
                              color: Colors.amber,
                              child: const Icon(Icons.favorite, size: 20.0, color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 150.0,
                                  child: Image.network(
                                    controller.cartProductModel[index].image.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          txt: controller.cartProductModel[index].name.toString(),
                                          fontSize: 16,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        CustomText(
                                          txt: "EGP " + controller.cartProductModel[index].price.toString(),
                                          color: primaryColor,
                                          fontSize: 18,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        //add number of products
                                        Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            alignment: Alignment.bottomRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      controller.increaseQuantity(index);
                                                    },
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                      size: 17,
                                                    )),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                CustomText(
                                                  txt: controller.cartProductModel[index].quantity.toString(),
                                                  alignment: Alignment.center,
                                                  fontSize: 17,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: (controller.cartProductModel[index].quantity == 0) ? null : () => controller.decreaseQuantity(index),
                                                  child: Container(
                                                      padding: const EdgeInsets.only(bottom: 12),
                                                      child: const Icon(
                                                        Icons.minimize,
                                                        color: Colors.black,
                                                        size: 17,
                                                      )),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: controller.cartProductModel.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 6,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              txt: "TOTAL",
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            GetBuilder<CartViewModel>(
                              init: Get.find<CartViewModel>(),
                              builder: (controller) => CustomText(
                                txt: "EGP " + controller.totalPrice.toString(),
                                color: primaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                            child: CustomButton(
                              txt: "CHECKOUT",
                              color: primaryColor,
                              onPressed: () =>
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutViewWidget(totalPrice: Get.find<CartViewModel>().totalPrice))),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    ));
  }
}
