part of 'first_run_bloc.dart';

@immutable
abstract class FirstRunState {}

class FirstRunInitial extends FirstRunState {}
class GetFirstRunInfoState extends FirstRunState {
  final bool isFirstRun;
  final int birthday;

  GetFirstRunInfoState(this.isFirstRun, this.birthday);
}
