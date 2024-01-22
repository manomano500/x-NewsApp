import 'package:dio/dio.dart';
Future<List> getData(String baseUrl, String endPoint, Function(Map<String, dynamic>) fromJson) async {
  Dio dio = Dio();

  try {
    dio.options.validateStatus = (status) => true;
    final response = await dio.get('$baseUrl$endPoint');

    print("Raw response data: ${response.data}");

    if (response.statusCode == 200) {
      dynamic data = response.data;
      print("Data type: ${data.runtimeType}");
      List responseList = data.map((item) => fromJson(item)).toList();
      print("Response List: $responseList");
      return responseList;

    } else {
      throw Exception('Failed to load data statusCode = ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    return []; // or handle the error appropriately
  }
}
