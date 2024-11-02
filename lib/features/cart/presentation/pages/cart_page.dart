import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(hideBack: false,),
    );
  }
}