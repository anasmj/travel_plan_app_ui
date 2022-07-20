import 'package:flutter/material.dart';

// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({super.key});

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.chat_rounded),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.location_pin),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: '',
//         ),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.black,
//       selectedIconTheme: const IconThemeData(size: 30),
//       type: BottomNavigationBarType.fixed,
//       unselectedItemColor: Colors.grey.shade800,
//       onTap: _onItemTapped,
//       elevation: 0.5,
//     );
//   }

//   void _onItemTapped(int index) {

//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// }

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<BottomNavigationBarItem> itemList = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(
      icon: Icon(Icons.location_pin),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '',
    ),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: itemList,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(size: 30),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey.shade800,
      onTap: _onItemTapped,
      elevation: 0.5,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
