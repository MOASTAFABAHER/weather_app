part of 'searchwether_cubit.dart';

@immutable
abstract class SearchwetherState {}

class SearchwetherInitial extends SearchwetherState {}
class SearchLoadingState extends SearchwetherState {}
class SearchSuccesState extends SearchwetherState {}
class SearchErrorState extends SearchwetherState {}
