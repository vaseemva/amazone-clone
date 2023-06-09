import 'package:amazone_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  TopButtonsState createState() => TopButtonsState();
}

class TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders',
              onPressed: () {},
            ),
            AccountButton(
              text: "Turn Seller",
              onPressed: () {},
            )
          ],
        ),
        Row(
          children: [
            AccountButton(
              text: 'Logout',
              onPressed: () {},
            ),
            AccountButton(
              text: "Your Wish List",
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
