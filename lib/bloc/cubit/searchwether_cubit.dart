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
  void getSearchData(String value) {
    {
      emit(SearchLoadingState());
      DioHelper.getData(url: '/current.json', query: {
        'key': '89b57ab3383c4fa986d82612220812',
        'q': 'cairo',
        'api': 'no'
      }).then((value) {
        request = Request.fromJson(value.data);
        emit(SearchSuccesState());
        print('Suc');
      }).catchError((error) {
        print(error);
      });
    }
  }
}
