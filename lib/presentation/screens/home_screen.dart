import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_public/core/theme/app_colors.dart';
import 'package:pos_public/presentation/screens/tabs/cart_tab.dart';
import 'package:pos_public/presentation/screens/tabs/home_tab.dart';
import 'package:pos_public/presentation/screens/tabs/orders_tab.dart';
import 'package:pos_public/presentation/screens/tabs/profile_tab.dart';
import 'package:pos_public/presentation/widgets/nav_item.dart';
import 'package:uicons/uicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  void dispose() {
    currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Branding",
          style: GoogleFonts.arizonia(color: AppColors.primary, fontSize: 40),
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: AppColors.border)),
        toolbarHeight: 64,
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, value, child) {
          return IndexedStack(
            index: value,
            children: const [
              HomeTab(),
              CartTab(),
              OrdersTab(),
              ProfileTab(),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: SafeArea(
          top: false,
          child: Container(
            height: 74,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.border)),
              color: AppColors.surface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
              ),
            ),
            child: ValueListenableBuilder(
              valueListenable: currentIndex,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavItem(
                      isSelected: value == 0,
                      icon: UIcons.regularRounded.home,
                      label: "Home",
                      onPressed: value == 0
                          ? null
                          : () => currentIndex.value = 0,
                    ),
                    NavItem(
                      icon: UIcons.regularRounded.shopping_cart,
                      label: "Cart",
                      isSelected: value == 1,
                      onPressed: value == 1
                          ? null
                          : () => currentIndex.value = 1,
                    ),
                    NavItem(
                      icon: UIcons.regularRounded.document_signed,
                      label: "Orders",
                      isSelected: value == 2,
                      onPressed: value == 2
                          ? null
                          : () => currentIndex.value = 2,
                    ),
                    NavItem(
                      icon: UIcons.regularRounded.user,
                      label: "Profile",
                      isSelected: value == 3,
                      onPressed: value == 3
                          ? null
                          : () => currentIndex.value = 3,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
