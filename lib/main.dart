import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,useMaterial3: true
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: DrawerClass(),
    );
  }
}

class DrawerClass extends StatefulWidget {
 const DrawerClass({Key? key}) : super(key: key);

 @override
  State<DrawerClass> createState() => DrawerClassState();

}

class DrawerClassState extends State<DrawerClass> {
  int selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
           NavigationRail(
             groupAlignment: groupAlignment,
               selectedIndex: selectedIndex,
               onDestinationSelected: (int index) {
                setState(() {
               selectedIndex = index;
                }
                );
               },
             labelType: labelType,
             leading: showLeading
             ? FloatingActionButton(
               elevation: 0,
                 onPressed: () {

                 },
               child: const Icon(Icons.add),

             ) :  const SizedBox(),
        trailing: showTrailing
            ? IconButton(
          onPressed: () {

          },
          icon: const Icon(Icons.more_horiz_rounded),
        ) :

         const SizedBox(),

             destinations: <NavigationRailDestination>[
              NavigationRailDestination(
               icon: Icon(Icons.favorite_border),
               selectedIcon: Icon(Icons.favorite),
               label: Text('First')
              ),
              NavigationRailDestination(
              icon: Icon(Icons.bookmark_border),
              selectedIcon: Icon(Icons.favorite),
              label: Text('Second')
              ),
              NavigationRailDestination(
              icon: Icon(Icons.star_border),
              selectedIcon: Icon(Icons.star),
              label: Text('Third')
    ),

              ],

           ),
         const VerticalDivider(thickness: 1, width: 1),
          Expanded(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Text('selectedIndex: $selectedIndex'),
          const SizedBox(height: 10),
       OverflowBar(
    spacing: 10.0,
    children: <Widget>[
    ElevatedButton(
    onPressed:  () {
     setState(() {
       labelType = NavigationRailLabelType.none;
    }

     );
    },
    child: const Text('none'),),
      ElevatedButton(
        onPressed:  () {
          setState(() {
            labelType = NavigationRailLabelType.all;
          }

          );
        },
        child: const Text('all'),),
      ElevatedButton(
        onPressed:  () {
          setState(() {
            labelType = NavigationRailLabelType.selected;
          }

          );
        },
        child: const Text('selected'),),


    ],
    ),
         const SizedBox(height: 20),
            Text('Group alignment: $groupAlignment'),
            const SizedBox(height: 10),
            OverflowBar(
              spacing: 10.0,
              children: [
               ElevatedButton(onPressed: () {
                 setState(() {
                   groupAlignment = -1;
                 });

               }

                   , child: Text('Top'),
               ),

                ElevatedButton(onPressed: () {
                  setState(() {
                    groupAlignment = 0;
                  });

                }

                  , child: Text('Center'),
                ),

                ElevatedButton(onPressed: () {
                  setState(() {
                    groupAlignment = 1;
                  });

                }

                  , child: Text('Bottom'),
                ),

              ],
            ),

            

    ],
          ))
          ],
        ),
      ),
    );

  }



}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
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
