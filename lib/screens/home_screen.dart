import 'package:flutter/material.dart';
import 'package:toonsflix/models/webtoon_model.dart';
import 'package:toonsflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
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
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var webtoon = snapshot.data[index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              // children: [
              //   for (var webtoon in snapshot.data) Text(webtoon.title),
              // ],
            );
            //const Text("There is data!");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
          //const Text("There is no data!");
        },
      ),
    );
  }
}
