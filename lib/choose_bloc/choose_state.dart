part of 'choose_bloc.dart';

@immutable
abstract class ChooseState {}

class ChooseInitial extends ChooseState {
  final String random;

  ChooseInitial(this.random);
}


class AddChooseState extends ChooseState {
  final List<TextEditingController> controllers;

  AddChooseState(this.controllers);

}

class DeleteChooseState extends ChooseState {

}

class GenerateAnswerState extends ChooseState {

}
