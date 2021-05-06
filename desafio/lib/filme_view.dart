import 'package:desafio/filme.dart';
import 'package:flutter/material.dart';
import 'package:desafio/filme_controller.dart';

class FilmeView extends StatefulWidget {
  @override
  _FilmeViewState createState() => _FilmeViewState();
}

class _FilmeViewState extends State<FilmeView> {
  final controller = MovieController();

  @override
  void initState() {
    super.initState();
    controller.loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: Text(
            '    Lançamentos    ',
            style: TextStyle(fontSize: 16),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.red,
          ),
        ),
      ),
      body: FutureBuilder<List<Movie>>(
        future: controller.movie,
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
                  height: 500,
                  color: Colors.pink,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ComponentContainer(
                        imagem: 'https://image.tmdb.org/t/p/w300' +
                            snapshot.data[index].poster_path,
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

  const ComponentContainer({Key key, this.imagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imagem),
          fit: BoxFit.cover,

        ),
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
