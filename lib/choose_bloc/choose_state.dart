part of 'choose_bloc.dart';

@immutable
abstract class ChooseState {}

class ChooseInitial extends ChooseState {}


class AddChooseState extends ChooseState {
  final List<TextEditingController> controllers;

  AddChooseState(this.controllers);

}

class DeleteChooseState extends ChooseState {

}

class GenerateAnswerState extends ChooseState {

}
