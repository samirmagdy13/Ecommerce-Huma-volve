import 'package:ecommerce_app_huma_volve/core/networking/api_error_handler.dart';
import 'package:ecommerce_app_huma_volve/core/networking/api_result.dart';
import 'package:ecommerce_app_huma_volve/core/networking/api_service.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/category_response.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_response.dart';

class CatalogRepo {
  final ApiService _apiService;

  const CatalogRepo(this._apiService);

  Future<ApiResult<List<CategoryResponse>>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ProductResponse>>> getCategoryProducts(
    int categoryId,
  ) async {
    try {
      final response = await _apiService.getCategoryProducts(categoryId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
