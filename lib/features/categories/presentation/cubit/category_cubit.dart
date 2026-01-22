import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localharvest_canada/features/categories/domain/usecases/get_categories.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategories getCategories;

  CategoryCubit({required this.getCategories}) : super(CategoryInitial());

  Future<void> fetchCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await getCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
