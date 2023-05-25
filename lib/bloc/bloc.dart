import 'package:codixel/bloc/event.dart';
import 'package:codixel/bloc/state.dart';
import 'package:codixel/controllers/api/fetchUser.dart';
import 'package:codixel/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class randomBloc extends Bloc<randomEvent, randomState> {
  randomBloc() : super(InitialSate()) {
    on<reloadPressed>((event, emit) => {
          emit(LoadingState()),
          fetchInBloc()
        }); //on reloadpressed event it will emit loadingstate first then call fetchBloc. Inside that after loading data it will emit loadedstate with user data
  }

  FetchUser fetchUser = FetchUser();

  void fetchInBloc() async {
    User user = await fetchUser.fetcdata();
    emit(LoadedState(user));
  }
}
