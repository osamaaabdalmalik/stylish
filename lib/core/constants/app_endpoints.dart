abstract class AppEndpoints {
  static const String baseUrl = "10.0.2.2:8000"; // For Emulator on local host
  static const String apiVersion = "/api";

  //-------------------------------------------

  // Authentication Routes
  static const String getFeatures = "$apiVersion/features/get";
  static const String refreshToken = "$apiVersion/auth/refresh";

////-------------------------------------------
}
