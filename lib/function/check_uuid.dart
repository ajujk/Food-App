import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_app/constants/api_endpoints.dart';
import 'package:food_app/constants/status.dart';
import 'package:food_app/presentation/response_screen.dart';

bool isNetworkCallHappening = false;

Future<http.Response?> verifyBooking(String uuid, BuildContext context) async {
  if (isNetworkCallHappening) {
    return null;
  }
  isNetworkCallHappening = true;
  // Base URL
  String baseUrl = ApiConstants.baseUrl;

  // Query parameters
  Map<String, String> queryParameters = {
    "uuid": uuid,
  };

  try {
    // Make GET request
    final Uri uri =
        Uri.parse(baseUrl).replace(queryParameters: queryParameters);
    http.Response response = await http.get(uri);
    print(response.statusCode);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => ResponseScreen(
          responseStatus: response.statusCode == 200
              ? ResponseStatus.success
              : ResponseStatus.internalError,
        ),
      ),
    );

    // Return response
    return response;
  } catch (e) {
    // Handle error
    print("Error fetching data: $e");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => ResponseScreen(
          responseStatus: ResponseStatus.success,
        ),
      ),
    );
    rethrow; // Rethrow the error for the caller to handle
  } finally {
    isNetworkCallHappening = false;
  }
}
