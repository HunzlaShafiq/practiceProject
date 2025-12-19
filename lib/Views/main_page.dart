import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:practice_project/Views/coming_soon.dart';
import 'package:practice_project/Views/home_page.dart';
import 'package:practice_project/Views/profile_View.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<Widget> pages = const [
    HomePage(),
    ComingSoon(),
    ComingSoon(),
    ComingSoon(),
    ProfileView()
  ];


  int selectedIndex = 0;

  final List<IconData> icons = [
    Icons.home_filled,
    Icons.search_rounded,
    Icons.add,
    Icons.favorite_border,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomBar(
        barColor: Colors.white,
        width: MediaQuery.of(context).size.width * 0.92,
        borderRadius: BorderRadius.circular(30),
        offset: 18,
        hideOnScroll: false,
        body: (context, controller) {
          return IndexedStack(
            index: selectedIndex,
            children: pages,
          );
        },


        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              return _buildItem(index);
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    final bool isCenter = index == 2;
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: isCenter
          ? Container(
        height: 42,
        width: 42,
        decoration: const BoxDecoration(
          color: Color(0xffFF5205),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 26,
        ),
      )
          : Icon(
        icons[index],
        size: 24,
        color: isSelected
            ? const Color(0xffFF5205)
            : Colors.grey.shade400,
      ),
    );
  }
}
