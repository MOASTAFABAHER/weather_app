import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/bloc/cubit/searchwether_cubit.dart';
import 'package:weather_app/models/app_colors.dart';

class WeatherScreen extends StatelessWidget {
  String? searchValue;
  WeatherScreen({required this.searchValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchwetherCubit(),
        child: BlocConsumer<SearchwetherCubit, SearchwetherState>(
          listener: (context, state) {
            if (state is SearchLoadingState) {
              CircularProgressIndicator();
            }
          },
          builder: (context, state) {
            var cubit = SearchwetherCubit.get(context);
            var feelsLike = cubit.request?.main!.feelsLike == null
                ? 0
                : ((cubit.request?.main!.feelsLike)! - 274).toStringAsFixed(0);
            var minTemp = cubit.request?.main!.tempMin == null
                ? 0
                : ((cubit.request?.main!.tempMin)! - 274).toStringAsFixed(0);
            var tempMax = cubit.request?.main!.tempMax == null
                ? 0
                : ((cubit.request?.main!.tempMax)! - 274).toStringAsFixed(0);
            var speed = cubit.request?.wind!.speed == null
                ? 0
                : ((cubit.request?.wind!.speed)!).toStringAsFixed(0);
            var visibility = cubit.request?.visibility == null
                ? 0
                : ((cubit.request?.visibility)! / 1000).toStringAsFixed(0);
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: cubit.request?.main!.temp == null
                          ? NetworkImage(
                              'https://images.pexels.com/photos/1755683/pexels-photo-1755683.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            )
                          : (cubit.request!.main!.temp!) - 273.4 > 20
                              ? NetworkImage(
                                  'https://images.pexels.com/photos/12440767/pexels-photo-12440767.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                )
                              : (cubit.request!.main!.temp!) - 273.4 <= 20
                                  ? NetworkImage(
                                      'https://images.pexels.com/photos/1755683/pexels-photo-1755683.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
                                  : NetworkImage(''),
                      fit: BoxFit.fill)),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        searchValue!,
                        style: TextStyle(
                            fontSize: 50.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.krOrangeColor),
                      ),
                      Text(
                        (cubit.request?.main!.temp) == null
                            ? 'Null'
                            : ((cubit.request!.main!.temp)! - 273)
                                .toStringAsFixed(0),
                        style: TextStyle(
                            color: AppColors.krOrangeColor,
                            fontSize: 60.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "feels Like=$feelsLike",
                        style: TextStyle(
                            fontSize: 22.sp, color: AppColors.krOrangeColor),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'min : $minTemp',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: AppColors.krOrangeColor),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'max : $tempMax',
                            style: TextStyle(
                                color: AppColors.krOrangeColor,
                                fontSize: 18.sp),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 270.h,
                      ),
                      Container(
                        height: 100.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.krWhiteColor.withOpacity(0.2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  speed.toString(),
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.krOrangeColor),
                                ),
                                Text(
                                  'Speed',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.krOrangeColor),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20.w,
                            ),  
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$visibility Km',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.krOrangeColor),
                                ),
                                Text(
                                  'visibility',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.krOrangeColor),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          backgroundColor: AppColors.krOrangeColor,
                          onPressed: () {
                            print(searchValue);
                            cubit.getSearchData(searchValue!);
                          },
                          child: Icon(Icons.replay_outlined),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
