import 'package:flutter/material.dart';


class ForecastContainer extends StatelessWidget {
  const ForecastContainer({super.key, required this.titleText,required this.customListView, required this.height});
 final String titleText;
 final Widget customListView;
 final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardColor,
      ),
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
              child: Text(
                titleText,
                style:
                    TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color:Theme.of(context).hintColor,),
            ),
            Flexible(
              child: customListView,
            ),
          ],
        ),
      ),
    );
  }
}


