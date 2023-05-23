import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:promt_app/constants.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, String> {
  RandomBloc() : super("") {
    on<RandomIntEvent>(_onGetRandom);
  }
  _onGetRandom(RandomIntEvent event , Emitter emit){
    int range = event.endNumber - event.initNumber + 1;
    // DateTime initTime = DateTime(1998, 10, 23, 05, 45);
      int result =
          DateTime.now().millisecondsSinceEpoch - Constants.birthday;
        result = (result % range);
        emit((result + event.initNumber).toString());

  }
}
