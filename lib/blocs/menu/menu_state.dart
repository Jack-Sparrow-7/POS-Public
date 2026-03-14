part of 'menu_bloc.dart';

sealed class MenuState {}

final class MenuInitial extends MenuState {}

final class MenuLoading extends MenuState {}

final class MenuLoaded extends MenuState {
  final MenuStore store;
  final List<MenuCategory> categories;
  final List<MenuProduct> products;

  MenuLoaded({
    required this.store,
    required this.categories,
    required this.products,
  });
}

final class MenuError extends MenuState {
  final String message;

  MenuError({required this.message});
}

