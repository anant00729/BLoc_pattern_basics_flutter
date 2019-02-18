import 'package:bloc_pattern_counter_app/bloc_lib/conuter_state.dart';
import 'package:bloc_pattern_counter_app/bloc_lib/counter_bloc.dart';
import 'package:bloc_pattern_counter_app/bloc_lib/counter_page_two.dart';
import 'package:bloc_pattern_counter_app/pages/page_one.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _counterBloc = ConuterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _counterBloc,
      child: CounterStateless(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.dispose();
  }
}

class CounterStateless extends StatelessWidget {
  CounterStateless({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConuterBloc _c_b = BlocProvider.of<ConuterBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('hello all'),
        ),
        body: BlocBuilder(
          bloc: _c_b,
          builder: (context, CounterState state) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text('The Counter value is '),
                  Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  FlatButton(onPressed: () {


                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return CounterPageTwo();
                    }));




                    }, child: Text('Press'))
                ],
              ),
            );
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () => _c_b.onIncrement(),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () => _c_b.onDecrement(),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        ),


    );
  }

//  _onPressed(BuildContext context){
//
//  }

}
