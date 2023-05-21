import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, String> {
  CoinBloc() : super("") {
    on<GetAnswerEvent>(_onGetAnswer);
  }
  _onGetAnswer(GetAnswerEvent event, Emitter emit)async{
    emit("Изучаю воздействие магнитных бурь...");
    await Future.delayed(Duration(seconds: 3));
    emit("Вычисляю положение звёзд на орбите...");
    await Future.delayed(Duration(seconds: 3));
    DateTime initTime = DateTime(1998, 10, 23, 05, 45);
    int result =
        DateTime.now().millisecondsSinceEpoch - initTime.millisecondsSinceEpoch;
    if(result.isEven){
      emit("Да, сделай это прямо сейчас!");
    }else {
      emit("Нет, Дружище, не советую");
    }
  }
}
