import 'package:flutter/material.dart';

class GetStartedConrainer extends StatelessWidget {
  const GetStartedConrainer({required this.function,super.key});
 final void Function() function;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Find your weather',
              style: Theme.of(context).textTheme.headline1),
          const SizedBox(
            height: 5,
          ),
          Text('predictions in your City',
              style: Theme.of(context).textTheme.headline1),
          const SizedBox(
            height: 25,
          ),
          Text('Easy steps to predict the weather and',
              style: Theme.of(context).textTheme.headline2),
          const SizedBox(
            height: 5,
          ),
          Text('make your day easier',
              style: Theme.of(context).textTheme.headline2),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(onPressed: function, child: const Text('Get Start'))
        ],
      ),
    );
  }
}