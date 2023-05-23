part of 'choose_bloc.dart';

@immutable
abstract class ChooseState {}

class ChooseInitial extends ChooseState {
}


class AddChooseState extends ChooseState {
  final List<TextEditingController> controllers;

  AddChooseState(this.controllers);

}

class DeleteChooseState extends ChooseState {
  final List<TextEditingController> controllers;

  DeleteChooseState(this.controllers);
}

class GenerateAnswerState extends ChooseState {

  final String answer;

  GenerateAnswerState(this.answer);


}
