import 'package:flutter/material.dart';

import 'CustomText.dart';

class SocialButton extends StatelessWidget {
  final String name;
  final String imageName;
  final VoidCallback? onPressed;
  const SocialButton({Key? key, this.name = '', this.imageName = "assets/images/Icon_Facebook.png", this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade50,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: const ButtonStyle(
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            ),
        child: Row(
          children: [
            Image.asset(imageName),
            const SizedBox(width: 80),
            CustomText(
              txt: name,
              color: Colors.grey.shade700,
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
    );
  }
}
