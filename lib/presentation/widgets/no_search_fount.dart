import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class NoSearchFound extends StatelessWidget {
  const NoSearchFound({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Icon(
            Icons.search,
            size: 150,
            color: Theme.of(context).primaryColorLight,
          ),
          Text(
            'No results found',
            style:  TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 20),
          )
        ],)
      );
  }
}