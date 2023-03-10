import 'package:flutter/material.dart';
import 'package:flutter_api_testing/services/get_service.dart';

import '../model/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Posts>? posts;
  var isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  getApi() async {
    posts = await ApiServices().getPosts();
    if(posts != null || posts!.isEmpty){
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Testing'),
      ),
      body: ListView.builder(
        itemCount: posts?.length,
        itemBuilder: (context, index) => Card(
          child: Text(
            '${posts?[index].body}',
          ),
        ),
      )
    );
  }
}
