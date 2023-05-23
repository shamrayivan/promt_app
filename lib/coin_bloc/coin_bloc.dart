import 'dart:async';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../constants.dart';

part 'coin_event.dart';

part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(CoinInitial()) {
    on<GetAnswerEvent>(_onGetAnswer);
  }

  _onGetAnswer(GetAnswerEvent event, Emitter emit) async {
    List<String> phrases = [
      "Изучаю воздействие магнитных бурь...",
      "Вычисляю положение звёзд на орбите...",
      "Сейчас случайно не ретроградный меркурий?",
      "Спрашиваю у chatGPT...",
      "Пишу цыганке-гадалке из Instagram (запрещённое приложение на территории РФ)"
    ];
    int random = (DateTime.now().millisecondsSinceEpoch - Constants.birthday) % (phrases.length);
    emit(CoinLoadingState(phrases[random]));
    await Future.delayed(const Duration(seconds: 2));
    phrases.removeAt(random);
    random = DateTime.now().millisecondsSinceEpoch % (phrases.length);
    emit(CoinLoadingState(phrases[random]));
    await Future.delayed(const Duration(seconds: 2));
    DateTime initTime = DateTime(1998, 10, 23, 05, 45);
    int result =
        DateTime.now().millisecondsSinceEpoch - initTime.millisecondsSinceEpoch;
    if (result.isEven) {
      emit(CoinLoadedState(
          "Да, сделай это прямо сейчас!", Colors.green));
    } else {
      emit(CoinLoadedState("Нет, дружище, не советую", Colors.red));
    }
  }
}
