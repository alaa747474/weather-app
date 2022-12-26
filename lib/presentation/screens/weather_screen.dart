
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_app/constants/strings.dart';
import 'package:weather_app/logic/weather_cubit/weather_cubit.dart';
import 'package:weather_app/presentation/widgets/custom_container.dart';
import 'package:weather_app/presentation/widgets/daily_list_view.dart';
import 'package:weather_app/presentation/widgets/forecast_container.dart';
import 'package:weather_app/presentation/widgets/hourly_list_view.dart';
import 'package:weather_app/presentation/widgets/search_field.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key, required this.isDark});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Weather',style: TextStyle(color: Theme.of(context).primaryColorLight),),
        centerTitle: true,
        elevation: 0,backgroundColor: Colors.transparent,
      leading:IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Theme.of(context).primaryColorLight,)) ,),
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocBuilder<WeatherCubit,WeatherState>(builder: (context,state){
        if (state is WeatherLoaded) {
          return ListView(
            children:[ Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchField(submittedFun: (cityName){
                      Navigator.pushNamed(context, searchedCityScreen,arguments: cityName);
                    },),
                    const SizedBox(height: 15,),
                    Text('${state.location!.country}, ${state.location!.region}',
                    style: TextStyle(color: Theme.of(context).primaryColorLight,fontSize: 22)),
                    const SizedBox(height: 5,),
                    Text(state.location!.localtime.toString(),
                    style: TextStyle(color: Theme.of(context).hintColor,fontSize:17)),                       
                    Center(
                      child: Container(
                        margin:const EdgeInsets.all(15),
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: isDark ? const AssetImage('assets/images/light1.gif',)
                                      : const AssetImage('assets/images/dark1.gif'),fit: BoxFit.cover)),
                        ),
                    ),                    
                    Center(
                      child: Text(state.location!.name.toString(),
                      style: TextStyle(color: Theme.of(context).primaryColorLight,fontSize: 25)),
                    ),
                    
                    Center(
                      child: Text(state.current!.condition!.text.toString(),
                      style: TextStyle(color: Theme.of(context).hintColor,fontSize: 20)),
                    ),
                     Center(
                      child: Text('${state.current!.tempC!.round()}°C',
                      style: TextStyle(color: Theme.of(context).primaryColorLight,fontSize: 90)),
                    ),
                    
                    ForecastContainer(
                      height: 160,
                      titleText: 'Hourly Forecast',
                    customListView: HourlyListView(state: state)),
                    ForecastContainer(
                      height: 200,
                      titleText: '3-Day Forecast',
                    customListView: DailyListView(state: state,),
                ),
          
                   Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomContainer(title: 'Wind Degree',icon: Icons.wind_power,apiText: state.current!.windDegree.toString(),),
                        CustomContainer(title: 'Humidity',icon: Icons.water_drop_outlined,apiText: state.current!.humidity.toString(),),
                      ],
                     ),
                   ),
                    Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomContainer(title: 'Visibility',icon: Icons.visibility,apiText: '${state.current!.visKm}km'),
                        CustomContainer(title: 'UV',icon: Icons.sunny,apiText: state.current!.uv.toString(),),
                      ],
                     ),
                   ),
                   
                  ],
                ),
              ),
            )],
          );
        }else if(state is WeatherLoading){
          return Center(child: LoadingAnimationWidget.fourRotatingDots(color: Theme.of(context).hintColor, size: 100),);
        }else if(state is WeatherFailToload){
          return const Center(child: Text('Somethimg went wrong'),);
        }return Center(child: LoadingAnimationWidget.fourRotatingDots(color: Theme.of(context).hintColor, size: 100),);
      }),
    );
  }
}




