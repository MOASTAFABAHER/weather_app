import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/cubit/searchwether_cubit.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'.toUpperCase()),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => SearchwetherCubit()..getSearchData('value'),
        child: BlocConsumer<SearchwetherCubit, SearchwetherState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = SearchwetherCubit.get(context);
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://s7d2.scene7.com/is/image/TWCNews/nature-summer-the-sun-weatherjpgjpgjpgcroppedjpg',
                      ),
                      fit: BoxFit.fill)),
              child: Column(
                children: [Text('tda')],
              ),
            );
          },
        ),
      ),
    );
  }
}
