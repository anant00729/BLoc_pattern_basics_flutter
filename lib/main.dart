import 'package:bloc_pattern_counter_app/bloc_lib/counter_page.dart';
import 'package:bloc_pattern_counter_app/bloc_lib/counter_page_two.dart';
import 'package:bloc_pattern_counter_app/counter_bloc.dart';
import 'package:bloc_pattern_counter_app/counter_event.dart';
import 'package:bloc_pattern_counter_app/date_picker/date_picker_page.dart';
import 'package:bloc_pattern_counter_app/pages/page_one.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello all'),
        ),
        body: Center(
          child: StreamBuilder(
              stream: _bloc.counter,
              initialData: 0,
              builder: (BuildContext context,AsyncSnapshot<int> snap){
            return Column(
              children: <Widget>[
                Text('the counter value is '),
                Text('${snap.data}', style: Theme.of(context).textTheme.display1,)
              ],
            );
          })
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(width: 10,),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        ),
      bottomNavigationBar:  FlatButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) {
          return PageOne(key: UniqueKey(),);
        }));
      }, child: Text('Press')),
    );

  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
