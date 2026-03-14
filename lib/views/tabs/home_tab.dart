import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pos_public/blocs/menu/menu_bloc.dart';
import 'package:pos_public/core/theme/app_colors.dart';
import 'package:pos_public/core/theme/app_shadows.dart';
import 'package:pos_public/widgets/category_chip.dart';
import 'package:pos_public/widgets/product_card.dart';
import 'package:uicons/uicons.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedCategoryIndex = 0;
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        if (state is MenuLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MenuLoaded) {
          final store = state.store;
          final categories = state.categories;
          final hasCategories = categories.isNotEmpty;
          final activeIndex = hasCategories
              ? selectedCategoryIndex.clamp(0, categories.length - 1)
              : 0;
          final normalizedQuery = searchQuery.trim().toLowerCase();
          final isSearching = normalizedQuery.isNotEmpty;
          final selectedCategoryName = hasCategories
              ? categories[activeIndex].name
              : 'Categories';
          final products = isSearching
              ? state.products.where((product) {
                  final name = product.name.toLowerCase();
                  final description = (product.description ?? '').toLowerCase();
                  return name.contains(normalizedQuery) ||
                      description.contains(normalizedQuery);
                }).toList()
              : hasCategories
              ? state.products
                    .where(
                      (product) =>
                          product.categoryId == categories[activeIndex].id,
                    )
                    .toList()
              : state.products;
          final sectionTitle = isSearching
              ? 'Search Results'
              : selectedCategoryName;

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store.name,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Hey, what's for lunch? 👋",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(24),
                Container(
                  height: 48,
                  decoration: const BoxDecoration(
                    boxShadow: AppShadows.searchShadow,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  child: SearchBar(
                    controller: searchController,
                    leading: Icon(
                      UIcons.regularRounded.search,
                      size: 18,
                      color: AppColors.mutedForeground,
                    ),
                    padding: const WidgetStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16),
                    ),
                    backgroundColor: const WidgetStatePropertyAll<Color>(
                      AppColors.card,
                    ),
                    elevation: const WidgetStatePropertyAll<double>(0),
                    hintText: 'Would you like to eat something?',
                    hintStyle: const WidgetStatePropertyAll<TextStyle>(
                      TextStyle(fontSize: 14, color: AppColors.mutedForeground),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
                if (!isSearching) ...[
                  const Gap(24),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8,
                      children: List.generate(categories.length, (index) {
                        final category = categories[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                          child: CategoryChip(
                            isSelected: index == activeIndex,
                            name: category.name,
                            imageUrl: category.imageUrl,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
                const Gap(24),
                Text(
                  sectionTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(12),
                if (products.isEmpty)
                  Center(
                    child: const Text(
                      'No products found.',
                      style: TextStyle(color: AppColors.mutedForeground),
                    ),
                  )
                else
                  Column(
                    spacing: 12,
                    children: List.generate(products.length, (index) {
                      final product = products[index];

                      return ProductCard(product: product);
                    }),
                  ),
              ],
            ),
          );
        }

        if (state is MenuError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
