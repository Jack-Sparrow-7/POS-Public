import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_public/blocs/menu/menu_bloc.dart';
import 'package:pos_public/core/di/injection.dart';
import 'package:pos_public/core/storage/current_store_storage.dart';
import 'package:pos_public/core/theme/app_colors.dart';
import 'package:pos_public/core/theme/app_shadows.dart';
import 'package:pos_public/views/tabs/cart_tab.dart';
import 'package:pos_public/views/tabs/home_tab.dart';
import 'package:pos_public/views/tabs/orders_tab.dart';
import 'package:pos_public/views/tabs/profile_tab.dart';
import 'package:pos_public/widgets/nav_item.dart';
import 'package:uicons/uicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.storeId});

  final String? storeId;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _persistStoreId();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.storeId != widget.storeId) {
      _persistStoreId();
    }
  }

  void _persistStoreId() {
    if (widget.storeId != null) {
      sl<CurrentStoreStorage>().saveStoreId(widget.storeId!);
    }
  }

  @override
  void dispose() {
    currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.storeId == null) {
      return const Scaffold(body: SizedBox.shrink());
    }

    return Scaffold(
      body: BlocProvider(
        key: ValueKey(widget.storeId),
        create: (context) =>
            sl<MenuBloc>()..add(MenuRequested(storeId: widget.storeId!)),
        child: ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, value, child) {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 440),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: IndexedStack(
                    index: value,
                    children: [HomeTab(), CartTab(), OrdersTab(), ProfileTab()],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, child) {
          return SafeArea(
            minimum: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 440),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(999),
                      boxShadow: AppShadows.navShadow,
                    ),
                    child: Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NavItem(
                          name: "Home",
                          icon: value == 0
                              ? UIcons.solidRounded.home
                              : UIcons.regularRounded.home,
                          isSelected: value == 0,
                          onPressed: value == 0
                              ? null
                              : () => currentIndex.value = 0,
                        ),
                        NavItem(
                          name: "Cart",
                          icon: value == 1
                              ? UIcons.solidRounded.wallet
                              : UIcons.regularRounded.wallet,
                          isSelected: value == 1,
                          onPressed: value == 1
                              ? null
                              : () => currentIndex.value = 1,
                        ),
                        NavItem(
                          name: "Orders",
                          icon: value == 2
                              ? UIcons.solidRounded.clipboard_list
                              : UIcons.regularRounded.clipboard_list,
                          isSelected: value == 2,
                          onPressed: value == 2
                              ? null
                              : () => currentIndex.value = 2,
                        ),
                        NavItem(
                          name: "Profile",
                          icon: value == 3
                              ? UIcons.solidRounded.user
                              : UIcons.regularRounded.user,
                          isSelected: value == 3,
                          onPressed: value == 3
                              ? null
                              : () => currentIndex.value = 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
