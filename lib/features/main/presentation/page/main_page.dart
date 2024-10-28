import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/main/presentation/cubits/navigation_cubit.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/presentation/pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const List<Widget> _pages = <Widget>[
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        body: _appBody(),
        bottomNavigationBar: _bottomNavigationApp(),
      ),
    );
  }

  Widget _appBody() {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.horizontalPagePadding,
            ),
            child: _pages[state],
          ),
        );
      },
    );
  }

  Widget _bottomNavigationApp() {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.receipt),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: state,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            context.read<NavigationCubit>().selectTab(index);
          },
        );
      },
    );
  }
}
