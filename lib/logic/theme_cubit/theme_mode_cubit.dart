import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:weather_app/data/service/cache/theme_prefs.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(ThemeModeInitial());
  ThemeCache themeCache=ThemeCache();
  
  Future<bool> getSavedTheme()async{
    bool isDark=await themeCache.getSavedBoolTheme();
    emit(GetThemeBool(isDark: isDark));
    return isDark;
  }

  changeToDark(){
     themeCache.saveBoolTheme(false);
    emit(GetThemeBool(isDark: false));
  }
  
  changeToLight(){
   themeCache.saveBoolTheme(true);
    emit(GetThemeBool(isDark: true));
  }
  
}
