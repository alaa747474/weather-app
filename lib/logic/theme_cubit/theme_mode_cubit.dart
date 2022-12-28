import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:weather_app/data/service/cache/theme_prefs.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(ThemeModeInitial());
  ThemeCache themeCache=ThemeCache();
  bool isDark=false;
  Future<bool> getSavedTheme()async{
     isDark=await themeCache.getSavedBoolTheme();
    emit(GetThemeBool(isDark: isDark));
    return isDark;
  }

  changeToDark(){
     themeCache.saveBoolTheme(false);
     isDark=false;
    emit(GetThemeBool(isDark: false));
  }
  
  changeToLight(){
   themeCache.saveBoolTheme(true);
   isDark=true;
    emit(GetThemeBool(isDark: true));
  }
  
}
