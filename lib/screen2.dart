import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List<Photos> photoList = [];

  Future<List<Photos>> getPhotos() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        photoList.add(photos);
      }
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        title: const Text(
          "MY HOME PAGE",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotos(),
              builder: (context,AsyncSnapshot<List<Photos>> snapshot) {
                return ListView.builder(
                  itemCount: photoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                      ),
                      subtitle: Text(snapshot.data![index].title.toString()),
                      title: Text('Notes id:'+snapshot.data![index].id.toString()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  int id;

  Photos({required this.title, required this.url, required this.id});
}
