import 'package:flutter/material.dart';
import 'package:vizmo_demo/core/di/di.dart';
import 'package:vizmo_demo/core/utils/debouncer.dart';
import 'package:vizmo_demo/presentation/blocs/employee/employee_cubit.dart';
import 'package:vizmo_demo/presentation/pages/employee_tab.dart';
import 'package:vizmo_demo/presentation/pages/profile_tab.dart';
import 'package:vizmo_demo/presentation/pages/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vizmo Demo'),
        actions: [
          IconButton(
            onPressed: () async {
              final employeeCubit = getIt<EmployeeCubit>();
              final debouncer = Debouncer(milliseconds: 300);
              final res = await showSearch(
                context: context,
                delegate: SearchScreen(employeeCubit, debouncer),
              );
              employeeCubit.close();
              debouncer.close();
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          EmployeeTab(),
          ProfileTab(),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Employee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
