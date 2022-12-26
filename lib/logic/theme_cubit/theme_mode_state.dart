part of 'theme_mode_cubit.dart';

@immutable
abstract class ThemeModeState{}

class ThemeModeInitial extends ThemeModeState {


}
class GetThemeBool extends ThemeModeState {
 final bool isDark;
  @override
  GetThemeBool({required this.isDark});

}

