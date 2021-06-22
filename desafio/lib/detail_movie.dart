import 'package:desafio/filme.dart';

import 'package:flutter/material.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie({Key key, @required this.secondDescription})
      : super(key: key);
  final Movie secondDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w300' +
                      secondDescription.poster_path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 50,
              child: Text(
                secondDescription.nome,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          secondDescription.release_date,
                          style: TextStyle(fontSize: 20),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 30),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '${secondDescription.vote_average}',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('Score'),
                          ],
                        ),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      secondDescription.overview,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
