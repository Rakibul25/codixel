import 'package:codixel/models/user.dart';

abstract class randomState {}

class InitialSate extends randomState {}

class LoadingState extends randomState {} //loading state

class LoadedState extends randomState {
  //loaded state
  final User user;
  LoadedState(this.user);
}
