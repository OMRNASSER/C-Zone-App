import 'package:flutter/material.dart';


// ignore: must_be_immutable
class EmptyResultWidget extends StatelessWidget {
  const EmptyResultWidget({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) => Container(
        alignment: AlignmentDirectional.topCenter,
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search, color: Theme.of(context).colorScheme.secondary, size: 50.0),
            const SizedBox(height: 10.0),
            Text("No data found", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 10.0),
            Text("Try adjusting your search further to find what you are looking for.", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1),
            
          ],
        ),
      );
}
