part of 'coin_bloc.dart';

@immutable
abstract class CoinState {}

class CoinInitial extends CoinState {}

class CoinLoadingState extends CoinState {
  final String loadingPhrase;

  CoinLoadingState(this.loadingPhrase);
}

class CoinLoadedState extends CoinState {
  final Color color;
  final String answer;

  CoinLoadedState(this.answer, this.color);
}
