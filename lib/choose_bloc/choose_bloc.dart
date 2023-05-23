import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:promt_app/Screens/choose_screen.dart';
import 'package:promt_app/constants.dart';

part 'choose_event.dart';
part 'choose_state.dart';

class ChooseBloc extends Bloc<ChooseEvent, ChooseState> {
  ChooseBloc() : super(ChooseInitial()) {
    on<AddNewTextFieldEvent>(_addChoose);
    on<DeleteNewTextFieldEvent>(_deleteChoose);
    on<GenerateAnswerEvent>(_generateAnswer);
  }

  _addChoose(AddNewTextFieldEvent event, Emitter emit){
    event.listController.add(TextEditingController());
    emit(AddChooseState(event.listController));
    // event.getControllers.add(TextEditingController());
    // state.add(TextEditingController());
    // emit(state.toList());
  }

  _deleteChoose(DeleteNewTextFieldEvent event, Emitter emit){
    if(event.listController.length > 1){
    event.listController.removeAt(event.index);
    emit(DeleteChooseState(event.listController));}
    else {}
  }


  _generateAnswer(GenerateAnswerEvent event, Emitter emit){
    int random = (DateTime.now().millisecondsSinceEpoch - Constants.birthday) % event.listController.length;
    print("kolvo ${event.listController.length}");
    emit(GenerateAnswerState(event.listController[random].value.text));
    // event.variant
    // emit(GenerateAnswerState());
    // a.add(state[random]);
    // emit(a);
    // state.removeLast();
  }
}
