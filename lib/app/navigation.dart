import 'package:flutter/material.dart';
import 'package:hookah/app/balance/balance_screen.dart';
import 'package:hookah/app/profile/profile_screen.dart';
import 'package:hookah/app/home/home_screen.dart';


class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
  final Key? key;

  Navigation({this.key}) : super(key: key);


}
class _NavigationState extends State<Navigation> {
  int _currentIndex = 0; // Индекс текущей выбранной вкладки

  // Список экранов, которые будут отображаться при выборе вкладки
  final List<Widget> _screens = [
    HomeScreen(),
    BalanceScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Отображаем текущий экран
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Текущий индекс
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Обновляем индекс при нажатии
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}