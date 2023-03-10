import 'dart:convert';

import 'package:flutter_api_testing/model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Posts>?> getPosts() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = response.body;
      return postsFromJson(json);
    }
  }
}
