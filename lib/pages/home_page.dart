import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterprovider/api/post_api.dart';
import 'package:flutterprovider/models/post.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Post>>(
            future: ApiRest.fetchPost(http.Client()),
            builder: (context, snapshot) {
              final data = snapshot.data;
              print('validacion de data ${data}');
              return ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Center(
                      child: data == null
                          ? CircularProgressIndicator()
                          : ListTile(
                              title: Text(data[index].title),
                            ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
