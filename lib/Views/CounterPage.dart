import 'package:bloccounter/counter_cubit.dart';
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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            }, child: Icon(Icons.arrow_back_ios)),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(state.counterValue.toString(),style: TextStyle(fontSize: 30),);
              },
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                }, child: Icon(Icons.arrow_forward_ios)),
          ],
        ),
      ),
    );
  }
}
