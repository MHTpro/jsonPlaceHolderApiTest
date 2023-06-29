import 'dart:convert';

import 'package:http/http.dart' as httpmethod;
import 'package:my_api/model/model.dart';

//all_data
Future<List<MainModel>> getAllRequest() async {
  final response = await httpmethod.get(
    Uri.https(
      "jsonplaceholder.typicode.com",
      "/posts",
    ),
  );
  if (response.statusCode == 200) {
    List<MainModel> allResponse;
    allResponse = List<MainModel>.from(
      jsonDecode(response.body).map(
        (value) => MainModel.fromJson(value),
      ),
    );
    return allResponse;
  } else {
    throw Exception("Error:Can't load all data!");
  }
}

//a_data
Future<MainModel> getRequest(int theId) async {
  final response = await httpmethod.get(
    Uri.https(
      "jsonplaceholder.typicode.com",
      "/posts/$theId",
    ),
  );

  if (response.statusCode == 200) {
    return MainModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception(
      "Error:Can't load the data",
    );
  }
}
