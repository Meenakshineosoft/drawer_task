import 'package:flutter/material.dart';

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

