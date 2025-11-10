import 'dart:convert';
import 'Models/PostModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  Future<List<PostModel>> getPostApi() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    final response = await http.get(url);

    print('🔹 Status Code: ${response.statusCode}');
    print('🔹 Response body starts with: ${response.body.substring(0, 100)}');

    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        print('🔹 Data type: ${data.runtimeType}');
        print('🔹 Data length: ${data.length}');
        List<PostModel> postList = [];

        for (Map<String, dynamic> item in data) {
          postList.add(PostModel.fromJson(item));
        }

        print('✅ Parsed posts: ${postList.length}');
        return postList;
      } catch (e) {
        print('❌ JSON Decode Error: $e');
        return [];
      }
    } else {
      print('❌ API Error: ${response.statusCode}');
      return [];
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
        title: const Text("MY HOME PAGE",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
            ),

      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<List<PostModel>>(
                  future: getPostApi(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator());
                    }else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data found.'));
                    }else{
                      final posts = snapshot.data!;
                    return ListView.builder(
                        itemCount: posts.length,
                          itemBuilder: (context, index){
                          return Card(
                            margin: const EdgeInsets.all(8),
                            child: Padding(
                                padding: const EdgeInsets.all(0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  Text(posts[index].name.toString(),),
                                  SizedBox(height: 5,),
                                  Text('Email', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  Text(posts[index].email.toString(),),
                                  SizedBox(height: 5,),
                                  Text('Body', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                  Text(posts[index].body.toString()),

                                ],
                              ),

                            ),
                          );
                          });
                    }
                  })
          ),
        ],
      ),

    );
  }
}
