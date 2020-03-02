import 'package:flutter/foundation.dart';
import 'package:flutterprovider/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';
class ApiRest{
    static Future<Album> fetchAlbum() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

    static Future<List<Post>> fetchPost(http.Client client) async {
      final response =
      await client.get('https://jsonplaceholder.typicode.com/albums');

      // Use the compute function to run parsePhotos in a separate isolate.
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Post>((json) => Post.fromJson(json)).toList();
    }


}

