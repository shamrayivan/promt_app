part of 'choose_bloc.dart';

@immutable
abstract class ChooseEvent {}

class AddNewTextFieldEvent extends ChooseEvent {}
class DeleteNewTextFieldEvent extends ChooseEvent {
  final int index;

  DeleteNewTextFieldEvent(this.index);
}

class GenerateAnswerEvent extends ChooseEvent {
  final List<String> variant;

  GenerateAnswerEvent(this.variant);
}

