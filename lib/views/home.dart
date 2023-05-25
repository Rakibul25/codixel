import 'package:codixel/bloc/bloc.dart';
import 'package:codixel/bloc/event.dart';
import 'package:codixel/bloc/state.dart';
import 'package:codixel/controllers/api/fetchUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:intl/intl.dart';
import '../models/user.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FetchUser fetchUser = FetchUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<randomBloc, randomState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(height: 150, width: 150, child: LoadingAnimation()),
                ],
              );
            } else if (state is InitialSate) {
              return Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text("No Data!"),
                    ),
                  ),
                ],
              );
            } else if (state is LoadedState) {
              DateTime date = DateTime.parse(state.user.dateOfBirth.toString());
              String formattedDate = DateFormat('MMM d, yyyy').format(date);
              return Container(
                width: 350,
                height: 350,
                color: Colors.black.withOpacity(0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      state.user.avatar,
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '${state.user.firstName} ${state.user.lastName}',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '${state.user.phoneNumber}',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      formattedDate,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  "Error!",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<randomBloc>(context)
              .add(reloadPressed()); //triggering button
        },
        child: const Icon(Icons.change_circle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'assets/loading_new.riv',
      // Replace with the actual path to your Rive animation asset
      fit: BoxFit.contain, // Set the desired fit for the animation
    );
  }
}
