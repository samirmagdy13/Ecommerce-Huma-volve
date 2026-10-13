import 'dart:async';

import 'package:ecommerce_app_huma_volve/core/networking/api_result.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/category_response.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/repos/catalog_repo.dart';
import 'package:ecommerce_app_huma_volve/features/home/view_model/catalog_cubit/catalog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogCubit extends Cubit<CatalogState> {
  final CatalogRepo _repo;
  int _productsRequestId = 0;

  CatalogCubit(this._repo) : super(const CatalogInitial());

  Future<void> fetchCategories() async {
    _productsRequestId++;
    emit(const CatalogLoading());
    final response = await _repo.getCategories();

    switch (response) {
      case Success(data: final categories):
        if (categories.isEmpty) {
          emit(
            const CatalogSuccess(
              categories: [],
              products: [],
              selectedCategoryId: null,
              productsLoading: false,
            ),
          );
          return;
        }

        final firstCategory = categories.first;
        emit(
          CatalogSuccess(
            categories: categories,
            products: const [],
            selectedCategoryId: firstCategory.id,
            productsLoading: true,
          ),
        );
        unawaited(_fetchProducts(categories, firstCategory.id));
      case Failure(apiErrorModel: final apiErrorModel):
        emit(CatalogError(apiErrorModel.message));
    }
  }

  Future<void> fetchProductsForCategory(int categoryId) async {
    final currentState = state;
    if (currentState is! CatalogSuccess) return;

    emit(
      CatalogSuccess(
        categories: currentState.categories,
        products: const [],
        selectedCategoryId: categoryId,
        productsLoading: true,
      ),
    );
    await _fetchProducts(currentState.categories, categoryId);
  }

  Future<void> _fetchProducts(
    List<CategoryResponse> categories,
    int categoryId,
  ) async {
    final requestId = ++_productsRequestId;
    final response = await _repo.getCategoryProducts(categoryId);
    if (requestId != _productsRequestId || isClosed) return;

    switch (response) {
      case Success(data: final products):
        emit(
          CatalogSuccess(
            categories: categories,
            products: products,
            selectedCategoryId: categoryId,
            productsLoading: false,
          ),
        );
      case Failure(apiErrorModel: final apiErrorModel):
        emit(
          CatalogSuccess(
            categories: categories,
            products: const [],
            selectedCategoryId: categoryId,
            productsLoading: false,
            productsError: apiErrorModel.message,
          ),
        );
    }
  }
}
