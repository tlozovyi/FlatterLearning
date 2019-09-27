import 'package:flutter/material.dart';
import 'package:test_drive_app/random_words_widget.dart';

class MainNavigationState extends State<MainNavigation> {
    int _currentNavigationIndex = 0;
    List<Widget> _pagesList = [
        RandomWords(),
        Container(color: Colors.red,),
        Container(color: Colors.blue.shade700,)
    ];
    
    @override
    Widget build(BuildContext context) =>
        Scaffold(
            body: _pagesList[_currentNavigationIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentNavigationIndex,
                onTap: _onNavigationTabSelected,
                items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.format_list_bulleted),
                        title: Text("List 1")
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.featured_play_list),
                        title: Text("List 2")
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.line_style),
                        title: Text("List 3")
                    ),
                ],
            ),
        );
    
    void _onNavigationTabSelected(int index) {
        if (index != _currentNavigationIndex) {
            setState(() {
                _currentNavigationIndex = index;
            });
        }
    }
}

class MainNavigation extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => MainNavigationState();
}