import 'package:bloc_test/bloc_test.dart';
import 'package:bloccounter/Cubit/counter_cubit.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  group('Counter Cubit', () {
    late CounterCubit counterCubit;

    setUp(() => counterCubit = CounterCubit());
    tearDown(() => counterCubit.close());

    test("this is the initial test", () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest("This this the blocl testing for incremnt function",
        build: () => counterCubit,
        act: (cubit) => counterCubit.increment(),
        expect: () => [CounterState(counterValue: 1, wasIncremented: true)],);

    blocTest("This this the bloc testing for decrement function",
      build: () => counterCubit,
      act: (cubit) => counterCubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],);
  });
}
