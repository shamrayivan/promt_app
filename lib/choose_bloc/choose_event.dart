part of 'choose_bloc.dart';

@immutable
abstract class ChooseEvent {}

class AddNewTextFieldEvent extends ChooseEvent {
  final List<TextEditingController> listController;

  AddNewTextFieldEvent(this.listController);
}
class DeleteNewTextFieldEvent extends ChooseEvent {
  final int index;
  final List<TextEditingController> listController;
  DeleteNewTextFieldEvent(this.index, this.listController);
}

class GenerateAnswerEvent extends ChooseEvent {
  final List<TextEditingController> listController;

  GenerateAnswerEvent(this.listController);
}

