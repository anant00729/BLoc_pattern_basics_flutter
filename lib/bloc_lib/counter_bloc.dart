import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_counter_app/bloc_lib/conuter_state.dart';
import 'package:bloc_pattern_counter_app/bloc_lib/counter_event.dart';
import 'conuter_state.dart';


class ConuterBloc extends Bloc<CounterEvent, CounterState> {

  void onIncrement(){
    dispatch(IncrementCounterEvent());
  }

  void onDecrement(){
    dispatch(DecrementCounterEvent());
  }

  @override
  CounterState get initialState => CounterState(counter: 0);

  @override
  Stream<CounterState> mapEventToState(CounterState currentState, CounterEvent event) async* {

    if(event is IncrementCounterEvent){
      yield CounterState(counter: currentState.counter + 1);
    }else if(event is DecrementCounterEvent){
      yield CounterState(counter: currentState.counter - 1);
    }

  }




}