import 'package:flutter/material.dart';

// functions
// String getFullName(String firstName, String lastName) => '$firstName $lastName';

// String printMyName() {
//   return '';
// }

void main() {
  runApp(const MyApp());
}

//control statement
void test() {
  final name = 'foo';

  if (name == 'foo') {
    print('yes this is foo!');
  } else {
    print('No, this is not foo!');
  }
}

// operators
void testOperators() {
  const age = 20;
  const halfOfAge = age / 2;
  const doubleTheAge = age * 2;

  print('Age: $age');
  print('Half Of Age: $halfOfAge');
  print('doubleTheAge: $doubleTheAge');
}

// list in Dart
void dartList() {
  var names = ['foo', 'bar', 'baz'];
  final foo = names[0];

  print(foo);
  print(names.length);
  names.add('Ryan');
  print('names length: ${names.length} , names: $names');
}

// dart map
void dartMap() {
  var person = { 
    'age': 20,
    'name': 'foo'
  };

  print(person);
  person['lastname'] = 'Leps'; // adding new key
  print(person);
}

// dart null
void dartNull() {
  List<String?>? names = ['foo', 'Bar', null];
  names = null;
  print(names);
}

// future function in dart
Future<int> heavyFutureThatMultipliesByTwo(int a) {
  return Future.delayed(const Duration(seconds: 3), () {
    return a * 2;
  });
}

// streams - an async 'pipe' of data
Stream<String> getName() {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    return 'Rayan';
  });
}

// generators - for generating 'iterables', marked with sync* and async*
Iterable<int> getOneTwoThree() sync* {
  yield 1;
  yield 2;
  yield 3;
}

// generics - to avoid re-writing similar code 
class Pair<A, B> {
  final A value1;
  final B value2;

  Pair(this.value1, this.value2);
}

// test future/stream in dart
void testFuture() async {
  // generics
  final names = Pair('ry', 20);

  final result = await heavyFutureThatMultipliesByTwo(10);
  print('Future result: $result');

  for (final value in getOneTwoThree()) {
    print(value);
  }

  await for (final value in getName()) { 
    print('value in stream: $value');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print(getFullName('Ryan', 'Leps'));
    test();
    testOperators();
    dartList();
    dartMap();
    testFuture();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
