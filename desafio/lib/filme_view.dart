import 'package:desafio/detail_movie.dart';
import 'package:desafio/filme.dart';
import 'package:flutter/material.dart';
import 'package:desafio/filme_controller.dart';

class FilmeView extends StatefulWidget {
  @override
  _FilmeViewState createState() => _FilmeViewState();
}

class _FilmeViewState extends State<FilmeView> {
  final viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: Text(
            '    Up comming    ',
            style: TextStyle(fontSize: 20),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      body: StreamBuilder<List<Movie>>(
        stream: viewModel.streamLista.stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:

            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );

            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Erro ao carregar dados!'),
                );
              } else {
                return Container(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      if (index == snapshot.data.length - 2) {
                        viewModel.newPage();
                      }
                      var movie = snapshot.data[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailMovie(
                                secondDescription: movie,
                              ),
                            ),
                          );
                        },
                        child: ComponentContainer(
                          imagem: movie.poster_path != null
                              ? 'https://image.tmdb.org/t/p/w300' +
                                  movie.poster_path
                              : 'https://thumbs.dreamstime.com/b/erro-ou-%C3%ADcone-n%C3%A3o-encontrado-no-fundo-cinzento-108178373.jpg',
                          data: movie.release_date,
                          nome: movie.nome,
                        ),
                      );
                    },
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

class ComponentContainer extends StatelessWidget {
  final String imagem;
  final String nome;
  final String data;

  const ComponentContainer({Key key, this.imagem, this.nome, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(imagem),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.all(10),
        ),
        Positioned(
          right: 50,
          top: 20,
          child: Card(
            color: Colors.black,
            child: Text(
              data,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        Positioned(
          bottom: 25,
          child: Card(
            color: Colors.black,
            child: Text(
              nome,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
