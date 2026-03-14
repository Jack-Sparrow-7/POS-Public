part of 'menu_bloc.dart';

sealed class MenuEvent {}

final class MenuRequested extends MenuEvent {
  final String storeId;

  MenuRequested({required this.storeId});
}
