import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyListView extends StatelessWidget {
  const DailyListView({super.key, this.state});
 final dynamic state;
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.forecast!.forecastday.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                   var x= DateTime.parse(state.forecast.forecastday[index].date);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            
                            SizedBox(width: 105,child: Text( DateFormat('EEEE').format(x).toString(),style: TextStyle(fontSize: 20,color: Theme.of(context).primaryColorLight),)),
                            SizedBox(width: 50,child: Image.network('https:${state.forecast.forecastday[index].day.condition.icon}',width: 50,height: 50,)),
                            const SizedBox(width: 5,),
                            SizedBox(width: 160,child: Text(state.forecast.forecastday[index].day.condition.text.toString(),style: TextStyle(fontSize: 17,color: Theme.of(context).primaryColorLight),)),
                           // Text(state.forecast.forecastday[index].day.avgtempC.toString(),style: TextStyle(fontSize: 20,color: Theme.of(context).primaryColorLight),),
                          ],
                        ),
                      ),
                    );
                  });
  }
}