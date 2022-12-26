import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key, required this.submittedFun,
  }) : super(key: key);
final  Function(String) submittedFun;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Theme.of(context).primaryColorLight),
      onSubmitted: submittedFun,
      cursorColor: Theme.of(context).hintColor,
      decoration: InputDecoration(
        focusColor:  Theme.of(context).hintColor,
        prefixIcon:Icon(Icons.search,color: Theme.of(context).hintColor),
        hintText: 'Search...',
        hintStyle: TextStyle(color: Theme.of(context).hintColor),
          filled: true,
          fillColor: Theme.of(context).cardColor,
         border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none
         ),
         
      ),
    );
  }
}   