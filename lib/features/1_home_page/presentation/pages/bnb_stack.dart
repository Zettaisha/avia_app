import 'package:avia_app/config/themes/colors.dart';
import 'package:avia_app/core/constants/constants.dart';
import 'package:avia_app/features/1_home_page/presentation/pages/homepage.dart';
import 'package:avia_app/features/1_home_page/presentation/widgets/bnb_stub_pages.dart';
import 'package:flutter/material.dart';

class BnbStack extends StatefulWidget {
  const BnbStack({super.key});

  @override
  State<BnbStack> createState() => _BnbStackState();
}

class _BnbStackState extends State<BnbStack> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Homepage(),
    const BnbStubPage(title: 'Отели'),
    const BnbStubPage(title: 'Талоны'),
    const BnbStubPage(title: 'Подписки'),
    const BnbStubPage(title: 'Профиль'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        color: AppColors.blackColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.blackColor,
            selectedItemColor: AppColors.darkBlue,
            unselectedItemColor: Colors.grey,
            unselectedFontSize: 10,
            selectedFontSize: 13,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(bnbPlaneImagePath)),
                label: 'Авиабилеты',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(bnbHotelsImagePath)),
                label: 'Отели',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(bnbLocationImagePath)),
                label: 'Короче',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(bnbSubscriptionImagePath)),
                label: 'Подписки',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(bnbProfileImagePath)),
                label: 'Профиль',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
