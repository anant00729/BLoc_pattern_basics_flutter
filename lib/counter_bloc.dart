import 'dart:async';


import 'counter_event.dart';

class CounterBloc{
  int _counter = 0;


  final _counterStateController = StreamController<int>();

  // this is private -> sink -> i/p
  StreamSink<int> get _inCounter => _counterStateController.sink;

  // this is public -> stream -> o/p
  Stream<int> get counter => _counterStateController.stream;

  // this is the i/p for the event
  final _counterEventController = StreamController<CounterEvent>();


  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;


  CounterBloc(){
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event){
    if(event is IncrementEvent){
      _counter++;
    }else {
      _counter--;
    }
    _inCounter.add(_counter);
  }


  dispose(){
    _counterEventController.close();
    _counterStateController.close();
  }


}