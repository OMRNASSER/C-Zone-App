import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/control_view.dart';

import '../Constant.dart';
import '../core/view_model/home_view_model.dart';
import 'Widget/CustomText.dart';
import 'details_view.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder: (controller) =>
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle:true ,
                iconTheme: IconThemeData(color: Colors.black , opacity: 100.0 ,size: 20 ),
                title:CustomText(txt:"Best Selling Products" , ),
              ) ,
                body: GridView.builder(

                  itemCount: controller.productModel.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2 , crossAxisSpacing: 10, mainAxisSpacing:20 , ),
                    itemBuilder: (context , index){
                      return GestureDetector(
                        onTap: () {Get.to(DetailsView(model:controller.productModel[index]));} ,
                        child: Container(
                          width:500,
                          height: 500,
                          child: Column(
                            children: [
                              Image.network(controller.productModel[index].image.toString(),
                                  width:MediaQuery.of(context).size.width *0.45,
                                  height: MediaQuery.of(context).size.height *0.179 ,
                                  fit: BoxFit.fill),
                              //Multi Images
                              // Image.network(controller.productModel[index].image1.toString(),
                              //     width:MediaQuery.of(context).size.width *0.45,
                              //     height: MediaQuery.of(context).size.height *0.179 ,
                              //     fit: BoxFit.fill
                              // ),
                              CustomText(txt:controller.productModel[index].name.toString() ,alignment: Alignment.center, ),
                              CustomText(txt:controller.productModel[index].brand.toString() ,alignment: Alignment.center,color: Colors.grey ),
                              CustomText(txt:"EGP " + controller.productModel[index].price.toString() ,alignment: Alignment.center, color:primaryColor, ),
                            ],
                          ),
                        ),
                      );
                    }
                ),


            )
    );
  }
}
