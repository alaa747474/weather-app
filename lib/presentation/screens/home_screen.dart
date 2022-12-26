import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/strings.dart';
import 'package:weather_app/logic/theme_cubit/theme_mode_cubit.dart';
import 'package:weather_app/presentation/widgets/get_start_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocBuilder<ThemeModeCubit, ThemeModeState>(
        builder: (context, state) {
          if (state is GetThemeBool) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 70),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<ThemeModeCubit>()
                                      .changeToLight();
                                },
                                icon: Icon(Icons.light_mode,
                                    color:
                                        Theme.of(context).primaryColorLight)),
                            IconButton(
                                onPressed: () {
                                  context.read<ThemeModeCubit>().changeToDark();
                                },
                                icon: Icon(Icons.dark_mode,
                                    color:
                                        Theme.of(context).primaryColorLight)),
                          ],
                        ),
                        Container(
                          height: 350,
                          width: 400,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: state.isDark
                                      ? const AssetImage(
                                          'assets/images/light.gif')
                                      : const AssetImage(
                                          'assets/images/dark.gif'))),
                        ),
                      ],
                    ),
                  ),
                ),
                GetStartedConrainer(
                  function: () {
                    Navigator.pushNamed(context, weatherScreen,arguments: state.isDark);
                  },
                ),
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
