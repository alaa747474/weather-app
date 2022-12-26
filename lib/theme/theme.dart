import 'package:flutter/material.dart';

enum AppTheme { light, dark }

Map appThemeData = {
  AppTheme.light: ThemeData(
    hintColor:const Color.fromARGB(255, 172, 172, 172),
      primaryColor: const Color(0xFFf4f4fc),
      cardColor: const Color(0xFFffffff),
      focusColor: const Color(0xFFb8adf1),
      
      primaryColorLight: const Color(0xFF111a2e),
      primaryColorDark: const Color(0xFFf4f4fc),
      textTheme:  TextTheme(
        headline1:const  TextStyle(letterSpacing: 1,fontSize: 25,color:Color(0xFF111a2e),fontWeight: FontWeight.w600,),
         headline2:  TextStyle(fontSize: 17,color:const Color(0xFF111a2e).withOpacity(0.2),)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          elevation: 0,backgroundColor: const Color(0xFFb8adf1),
        ),
      )
      ),
      
  AppTheme.dark: ThemeData(
    hintColor: const Color.fromARGB(255, 76, 92, 134),
    primaryColorDark: const Color(0xFF111a2e),
    primaryColorLight: const Color(0xFFf4f4fc),
    primaryColor: const Color(0xFF111a2e),
      cardColor: const Color.fromARGB(255, 28, 38, 63),
      focusColor: const Color(0xFFb8adf1),
      textTheme: TextTheme(
        headline1:  const TextStyle(letterSpacing: 1,fontSize: 25,color: Color(0xFFf4f4fc),fontWeight: FontWeight.w600,),
        headline2:  TextStyle(fontSize: 18,color:const  Color(0xFFf4f4fc).withOpacity(0.2),)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          elevation: 0,backgroundColor: const Color.fromARGB(255, 58, 72, 108),
        ),
      )
  )
};
