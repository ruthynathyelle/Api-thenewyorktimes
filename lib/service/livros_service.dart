import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:livrosmaisvendidos/model/livros_model.dart';

class LivrosService {
  final String _apiKey = 'mABAPDf9y6yf5VxJ5an2N4kq7HMJWS11';  
  final String _apiBaseUrl = 'https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json';

  Future<List<Livro>> obterLivrosMaisVendidos() async {
    final response = await http.get(Uri.parse('$_apiBaseUrl?api-key=$_apiKey'));


    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> livrosJson = data['results']['books'];
      return livrosJson.map((json) => Livro.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar dados: ${response.reasonPhrase}');
    }
  }
}
