import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.apiText});
  final IconData icon;
  final String title;
  final String apiText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).cardColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: Theme.of(context).hintColor, fontSize: 20),
          ),
          Icon(
            icon,
            color: Theme.of(context).hintColor,
            size: 60,
          ),
          Text(
            apiText,
            style: TextStyle(color: Theme.of(context).hintColor, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
