import "package:flutter/material.dart";



class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Scaffold(
          body: Text("Hello From Cart "),
        ),
      ),
    );
  }
}
