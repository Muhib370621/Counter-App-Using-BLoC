import 'package:bloccounter/Cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Bloc Counter",
      )),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Incremented"),
              duration: Duration(milliseconds: 300),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Decremented"),
                duration: Duration(milliseconds: 300),
              ),
            );
          }
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: Icon(Icons.arrow_back_ios)),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: TextStyle(fontSize: 30),
                  );
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: Icon(Icons.arrow_forward_ios)),
            ],
          ),
        ),
      ),
    );
  }
}
