import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({Key? key, required this.link}) : super(key: key);

  final String link;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Colors.black12),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 180,
          child: Image.network(
            link,
            fit: BoxFit.fitHeight,
            width: 180,
          ),
        ),
      ),
    );
  }
}
