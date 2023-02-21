import 'package:flutter/material.dart';
import 'package:toonsflix/models/webtoon_model.dart';
import 'package:toonsflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
  @override
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Center(
          child: Text(
            "Today's 툰s",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          // textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return const Text("There is data!");
          }
          return const Text("There is no data!");
        },
      ),
    );
  }
}
