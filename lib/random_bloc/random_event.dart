part of 'random_bloc.dart';

@immutable
abstract class RandomEvent {

}


class RandomIntEvent extends RandomEvent {
  final int initNumber;
  final int endNumber;

  RandomIntEvent(this.initNumber, this.endNumber);

}
