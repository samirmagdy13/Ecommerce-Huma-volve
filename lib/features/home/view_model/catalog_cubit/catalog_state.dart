import 'package:ecommerce_app_huma_volve/features/home/data/models/category_response.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_response.dart';

sealed class CatalogState {
  const CatalogState();
}

final class CatalogInitial extends CatalogState {
  const CatalogInitial();
}

final class CatalogLoading extends CatalogState {
  const CatalogLoading();
}

final class CatalogError extends CatalogState {
  final String error;

  const CatalogError(this.error);
}

final class CatalogSuccess extends CatalogState {
  final List<CategoryResponse> categories;
  final List<ProductResponse> products;
  final int? selectedCategoryId;
  final bool productsLoading;
  final String? productsError;

  const CatalogSuccess({
    required this.categories,
    required this.products,
    required this.selectedCategoryId,
    required this.productsLoading,
    this.productsError,
  });
}
