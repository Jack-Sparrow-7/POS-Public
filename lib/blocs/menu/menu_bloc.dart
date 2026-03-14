import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_public/models/menu/menu_category/menu_category.dart';
import 'package:pos_public/models/menu/menu_product/menu_product.dart';
import 'package:pos_public/models/menu/menu_store/menu_store.dart';
import 'package:pos_public/repositories/menu_repository.dart';

part 'menu_event.dart';
part 'menu_state.dart';

@injectable
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository menuRepository;

  MenuBloc({required this.menuRepository}) : super(MenuInitial()) {
    on<MenuRequested>((event, emit) => _onMenuRequested(event, emit));
  }

  String _errorMessage(Object? error) {
    final message = '$error';

    return message.startsWith('Exception: ')
        ? message.replaceFirst('Exception: ', '')
        : message;
  }

  Future<void> _onMenuRequested(
    MenuRequested event,
    Emitter<MenuState> emit,
  ) async {
    emit(MenuLoading());

    try {
      final response = await menuRepository.getMenu(storeId: event.storeId);

      emit(
        MenuLoaded(
          store: response.data.store,
          categories: response.data.categories,
          products: response.data.products,
        ),
      );
    } catch (e) {
      emit(MenuError(message: _errorMessage(e)));
    }
  }
}
