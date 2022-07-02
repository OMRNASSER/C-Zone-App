import 'package:untitled/view/Widget/CustomText.dart';
import 'package:untitled/view/all_categories.dart';
import '../core/view_model/profile_view_model.dart';
import 'package:untitled/view/all_products.dart';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: Get.put(ProfileViewModel()),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //name and avatar
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                color: Colors.green[200],
                                borderRadius: const BorderRadius.all(Radius.circular(300.0)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: controller.userModel == null
                                      ? const AssetImage("assets/images/messi.jpg")
                                      : controller.userModel!.pic.toString() == "default"
                                          ? const AssetImage("assets/images/messi.jpg") as ImageProvider
                                          : NetworkImage(controller.userModel!.pic.toString()),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  txt: controller.userModel!.name.toString(),
                                  fontSize: 24.0,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                CustomText(
                                  txt: controller.userModel!.email.toString(),
                                  fontSize: 24,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      //Edit Profile
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/Icon_Edit-Profile.png",
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const CustomText(
                                  txt: "Edit Profile",
                                  fontSize: 18,
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ],
                        ),
                      ),
                      //Shipping Address
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/Icon_Location.png",
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const CustomText(
                                  txt: "Shipping Address",
                                  fontSize: 18,
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ],
                        ),
                      ),
                      //Order History
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/Icon_History.png",
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const CustomText(
                                  txt: "Order History",
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ],
                        ),
                      ),
                      //Cards
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/Icon_Payment.png",
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const CustomText(
                                  txt: "Cards",
                                  fontSize: 18,
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ],
                        ),
                      ),
                      //Notifications
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/Icon_Alert.png",
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const CustomText(
                                  txt: "Notifications",
                                  fontSize: 18,
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ],
                        ),
                      ),
                      //Log Out

                      Visibility(
                        //visible: controller.userModel!.role == 'admin',
                        child: GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AllProductsWidget())),
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/Icon_Exit.png",
                                    ),
                                    const SizedBox(width: 10.0),
                                    const CustomText(
                                      txt: "Edit products",
                                      fontSize: 18,
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        //visible: controller.userModel!.role == 'admin',
                        child: GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoriesWidget())),
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/Icon_Exit.png",
                                    ),
                                    const SizedBox(width: 10.0),
                                    const CustomText(
                                      txt: "Edit categories",
                                      fontSize: 18,
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(LoginScreen());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Icon_Exit.png",
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  const CustomText(
                                    txt: "Log Out",
                                    fontSize: 18,
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
