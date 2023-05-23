import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'first_run_event.dart';
part 'first_run_state.dart';

class FirstRunBloc extends Bloc<FirstRunEvent, FirstRunState> {
  FirstRunBloc() : super(FirstRunInitial()) {
    on<SaveFirstRunEvent>(_getInfo);
  }
  _getInfo(SaveFirstRunEvent event, Emitter emit)async{
    final prefs = await SharedPreferences.getInstance();
    final isFirstRun = prefs.getBool('isFirstRun') ?? true;
    final birthday = prefs.getInt('birthday') ?? 0;
    emit(GetFirstRunInfoState(isFirstRun, birthday));

  }
}
