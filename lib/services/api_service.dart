import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonsflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonIstances = [];

    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //print(response.body);
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonIstances.add(WebtoonModel.fromJson(webtoon));
        // final toon = WebtoonModel.fromJson(webtoon);
        // print(toon.title);
        //print(webtoon);
      }
      return webtoonIstances;
    }
    throw Error();
  }
}
