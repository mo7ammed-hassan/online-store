import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/helper/Bottom_nav_bar/generate_icon.dart';
import 'package:online_store/features/home/presentation/pages/home_page.dart';
import 'package:online_store/features/main/presentation/cubits/navigation_cubit.dart';
import 'package:online_store/features/order/presentation/pages/order_page.dart';
import 'package:online_store/features/profile/presentation/pages/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    SizedBox(),
    OrderPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: _pages[state],
            ),
            bottomNavigationBar: _bottomNavigationApp(),
          );
        },
      ),
    );
  }

  Widget _bottomNavigationApp() {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.08,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: generateBtnBarIcon('home', 0, state),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: generateBtnBarIcon('notification', 1, state),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: generateBtnBarIcon('order', 2, state),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: generateBtnBarIcon('profile', 3, state),
                label: 'Profile',
              ),
            ],
            currentIndex: state,
            onTap: (index) {
              context.read<NavigationCubit>().selectTab(index);
            },
          ),
        );
      },
    );
  }
}
