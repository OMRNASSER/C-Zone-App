import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled/core/view_model/home_view_model.dart';
import 'package:untitled/view/category_item_home.dart';
import 'package:untitled/view/Widget/CustomText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/flash_animation.dart';
import 'details_view.dart';

class Home_Screen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final List<String> names = <String>[
    "Men",
    "Girls",
    "S",
    "S",
    "S",
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Scaffold(
              body: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Column(
                      children: [
                        _searchTextFormField(),
                        const SizedBox(
                          height: 40,
                        ),
                        const CustomText(
                          txt: "Categories",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _listViewCategory(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlashAnimation(
                              duration: const Duration(seconds: 3),
                              infinite: true,
                              animate: true,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: Colors.deepPurpleAccent,
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.deepOrange,
                                      Colors.deepPurpleAccent,
                                    ],
                                    begin: FractionalOffset(0.0, 0.0),
                                    end: FractionalOffset(1.0, 0.0),
                                    stops: [
                                      0.0,
                                      1.0,
                                    ],
                                    tileMode: TileMode.clamp,
                                  ),
                                ),
                                child: Text(
                                  'Best Selling',
                                  style: Theme.of(context).textTheme.bodyText1!.merge(
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
                                      ),
                                ),
                              ),
                            ),
                            const CustomText(txt: "See all", fontSize: 15),
                          ],
                        ),
                        const SizedBox(height: 10),
                        _listViewProducts(),

                        //log out
                        //         Center(child:
                        //           FlatButton(
                        //             onPressed: () {
                        //             _auth.signOut();
                        //             Get.offAll(LoginScreen());
                        //           },
                        //             child:Text("Log Out"),
                        //       ),
                        //       ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
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
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => SizedBox(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryItemHomeWidget(categoryModel: controller.categoryModel.elementAt(index)))),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100,
                    ),
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                        controller.categoryModel[index].image.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                    height: 5.0,
                  ),
                  CustomText(
                    txt: controller.categoryModel[index].name.toString(),
                    fontSize: 12,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => SizedBox(
        height: 330,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsView(model: controller.productModel[index]));
              },
              child: Container(
                width:200,
                height:330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider.builder(
                      itemCount: controller.productModel[index].imagesList!.length,
                      options: CarouselOptions(
                        onPageChanged: (int index, CarouselPageChangedReason changedReason) {},
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        viewportFraction: 1.0,
                        autoPlay: true,
                        height: 250,
                      ),
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                        String string = controller.productModel[index].imagesList!.elementAt(itemIndex);
                        return Container(
                          height: 250,
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
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      txt: controller.productModel[index].name.toString(),
                      alignment: Alignment.bottomLeft,
                      fontSize: 17,
                      maxLine: 1,
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      txt: controller.productModel[index].brand.toString(),
                      color: Colors.grey,
                      fontSize: 15,
                      alignment: Alignment.bottomLeft,
                      maxLine: 1,
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      txt: controller.productModel[index].price.toString() + " EGP",
                      alignment: Alignment.bottomLeft,
                      color: primaryColor,
                      fontSize: 17,
                      maxLine: 1,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
