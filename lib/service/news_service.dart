import 'package:dio/dio.dart';
import 'package:news_app_example/model/artical_model.dart';

class NewsService {
  Dio dio = Dio();
  String baseurl = "https://newsapi.org/v2/everything";
  late Response response;
  String apikey = "bcf964f73b2644ec99b698e8d4282d25";
  String sortBy = "publishedAt";
  String from = "2025-08-22";

  Future<List<ArticalModel>> getNews(String title) async {
    try {
      
    response = await dio.get(
      baseurl,
      queryParameters: {
        "q": title,
        "sortBy": sortBy,
        "apikey": apikey,
        "from": from,
      },
    );
  print(response);
    List<ArticalModel> articals = [];
    for (var i = 0; i < response.data['articles'].length; i++) {
      articals.add(ArticalModel.fromMap(response.data['articles'][i]));
    }
    return articals;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
