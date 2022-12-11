import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/request.dart';
import 'package:weather_app/service/dio_helper/dio_helper.dart';

part 'searchwether_state.dart';

class SearchwetherCubit extends Cubit<SearchwetherState> {
  SearchwetherCubit() : super(SearchwetherInitial());
  Request? request;

  static SearchwetherCubit get(context) => BlocProvider.of(context);
   getSearchData(String value) {
    {
      emit(SearchLoadingState());
      DioHelper.getData(query: {
        'q': value,
        'appid': '8f7c666b5cf89aad214338e6f7d04dd5',
      }).then((value) {
      
        request = Request.fromJson(value.data);
        emit(SearchSuccesState());
        print('Suc');
      }).catchError((error) {
        print('Error =$error');
        emit(SearchErrorState());
      });
    }
  }
}
