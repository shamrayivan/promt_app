import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:promt_app/Screens/choose_screen.dart';

part 'choose_event.dart';
part 'choose_state.dart';

class ChooseBloc extends Bloc<ChooseEvent, List<TextEditingController>> {
  ChooseBloc() : super([TextEditingController()]) {
    on<AddNewTextFieldEvent>(_addChoose);
    on<DeleteNewTextFieldEvent>(_deleteChoose);
    on<GenerateAnswerEvent>(_generateAnswer);
  }

  _addChoose(AddNewTextFieldEvent event, Emitter emit){
    // event.getControllers.add(TextEditingController());
    state.add(TextEditingController());
    emit(state.toList());
  }

  _deleteChoose(DeleteNewTextFieldEvent event, Emitter emit){
    state.removeAt(event.index);
    emit(state.toList());
  }
  _generateAnswer(GenerateAnswerEvent event, Emitter emit){
    int random = DateTime.now().millisecondsSinceEpoch % event.variant.length;
    print(random);
    print("event.variant ${event.variant}");
    List <TextEditingController> a = [];
    a.add(state[random]);
    emit(a);
    // state.removeLast();
  }
}
