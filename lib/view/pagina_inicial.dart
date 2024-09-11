import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:livrosmaisvendidos/controller/livros_controller.dart';
import 'package:livrosmaisvendidos/service/url_utils.dart';
import 'package:livrosmaisvendidos/view/detalheslivro.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LivrosController()..carregarLivrosMaisVendidos(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Livros Mais Vendidos',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<LivrosController>(
          builder: (context, controller, child) {
            if (controller.estaCarregando) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.mensagemErro != null) {
              return Center(child: Text('Erro: ${controller.mensagemErro}'));
            }

            if (controller.livros == null || controller.livros!.isEmpty) {
              return Center(child: Text('Nenhum livro encontrado.'));
            }

            return ListView.builder(
              itemCount: controller.livros!.length,
              itemBuilder: (context, index) {
                final livro = controller.livros![index];
                return ListTile(
                  title: Text(livro.title),
                  subtitle: Text('Autor: ${livro.author}'),
                  isThreeLine: true,
                  onTap: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalhesLivroPage(livro: livro),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.red),
                    onPressed: () {
                      // URL para pesquisa na Amazon com o título do livro
                      final amazonSearchUrl =
                          'https://www.amazon.com.br/s?k=${Uri.encodeComponent(livro.title)}';
                      UrlUtils.abrirUrl(amazonSearchUrl);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}