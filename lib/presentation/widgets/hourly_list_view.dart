import 'package:flutter/material.dart';

class HourlyListView extends StatelessWidget {
  const HourlyListView({super.key,required this.state});
  final dynamic state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.forecast!.forecastday![0].hour!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                          margin: const EdgeInsets.only(
                              bottom: 10, left: 10, right: 10),
                          width: 60,
                          height: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.forecast!.forecastday![0].hour![index]
                                    .time!
                                    .toString()
                                    .replaceAll(
                                        "${state.forecast!.forecastday![0].date}",
                                        ''),
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              Image.network(
                                  'https:${state.forecast!.forecastday![0].hour![index].condition!.icon}'),
                              Text(
                                '${state.forecast!.forecastday![0].hour![index].tempC!}°C',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight),
                              )
                            ],
                          )),
                    );
                  });
  }
}