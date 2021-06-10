import 'dart:convert';

import 'package:kari_care_flutter/models/photo.dart';
import 'package:kari_care_flutter/services/api.dart';
import 'package:http/http.dart' as http;

class APIService {
  APIService(this.api);
  final API api;

  Future<List<Photo>> fetchPhotos(PageIndex index) async {
    final response = await http.get(api.pageUri(index));
    if (response.statusCode == 200) {
      String content = response.body;
      List collecton = json.decode(content);
      final List<Photo> data =
          collecton.map((json) => Photo.fromJson(json)).toList();
      return data;
    }
    print(
        'Request ${api.pageUri(PageIndex.page1)} failed\n ${response.statusCode} ${response.reasonPhrase} }}');
    throw response;
  }
}
