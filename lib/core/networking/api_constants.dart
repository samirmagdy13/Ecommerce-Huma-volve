class ApiConstants {
  static const String apiBaseUrl = "https://api.escuelajs.co";
  static const String login = "$apiBaseUrl/api/v1/auth/login";
  static const String categories = "/api/v1/categories";
  static const String categoryProducts =
      "/api/v1/categories/{categoryId}/products";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unAuthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String badWords = "badWords";
  static const String ok = "Ok";
}
