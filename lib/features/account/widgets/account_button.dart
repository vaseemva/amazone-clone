import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 50, 
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 0),
            borderRadius: BorderRadius.circular(50)),
        child: OutlinedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black12.withOpacity(0.03),shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                )),
            onPressed: () {},
            child: Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black),
            )),
      ),
    );
  }
}
