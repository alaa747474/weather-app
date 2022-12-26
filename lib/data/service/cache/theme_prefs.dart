
import 'package:shared_preferences/shared_preferences.dart';
class ThemeCache{
  Future<void>saveBoolTheme(bool isDark)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setBool('ISDARK', isDark);
  }
  Future<bool>getSavedBoolTheme()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    bool ?isDark = sharedPreferences.getBool('ISDARK');
    if (isDark!=null) {
      return isDark;
    }return false;
  }
}