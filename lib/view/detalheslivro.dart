import 'package:flutter/material.dart';
import 'package:livrosmaisvendidos/model/livros_model.dart';
import 'package:livrosmaisvendidos/service/url_utils.dart';

class DetalhesLivroPage extends StatelessWidget {
  final Livro livro;

  const DetalhesLivroPage({Key? key, required this.livro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(livro.title,
        style: TextStyle (

        ),),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Transform.scale(
                  scale: 1.0,
                  child: Image.network(
                    livro.imageUrl,
                    height: 250, 
                    fit: BoxFit.cover, 
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) {
                        return child;
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.error, color: Colors.red));
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                livro.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Autor: ${livro.author}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 16),
              Text(
                livro.description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    
                    final amazonSearchUrl =
                        'https://www.amazon.com.br/s?k=${Uri.encodeComponent(livro.title)}';
                    UrlUtils.abrirUrl(amazonSearchUrl);
                  },
                  child: Text(
                   'Comprar',
                    style: TextStyle(
                    color: Colors.white, // Altere para a cor desejada
                   ),
                  ),

                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
