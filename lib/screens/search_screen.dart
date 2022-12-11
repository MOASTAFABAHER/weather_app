import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/app_colors.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/utils/app_navigator.dart';

import '../bloc/cubit/searchwether_cubit.dart';

class SearchScreen extends StatelessWidget {
  String? searchvalue;
  SearchScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchwetherCubit(),
      child: BlocConsumer<SearchwetherCubit, SearchwetherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = SearchwetherCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.krOrangeColor,
              title: Text('Weather App'.toUpperCase()),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onChanged: (value) {
                    searchvalue = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    return null;
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            width: 3, color: AppColors.krOrangeColor)),
                    labelText: 'search',
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    cubit.getSearchData('value');

                    AppNavigator.appNavigator(
                        context,
                        WeatherScreen(
                          searchValue: searchvalue,
                        ));
                  },
                  child: Container(
                    width: 80.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.krOrangeColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'GO',
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColors.krWhiteColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
