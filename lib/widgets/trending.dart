import 'package:flutter/material.dart';
import 'package:movies_app/description.dart';
import 'package:movies_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trendingMovies;
  const TrendingMovies({Key? key, required this.trendingMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(
            text: 'Trending Movies',
            size: 26,
            color: Colors.red,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trendingMovies.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Description(
                            name: trendingMovies[index]['title'],
                            description: trendingMovies[index]['overview'],
                            bannerURL: 'https://image.tmdb.org/t/p/w500' +
                                trendingMovies[index]['backdrop_path'],
                            posterURL: 'https://image.tmdb.org/t/p/w500' +
                                trendingMovies[index]['poster_path'],
                            vote: trendingMovies[index]['vote_average']
                                .toString(),
                            launch_on: trendingMovies[index]['release_date']);
                      }));
                    },
                    child: trendingMovies[index]['title'] != null
                        ? Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trendingMovies[index]
                                                ['poster_path'],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: modifiedText(
                                    text: trendingMovies[index]['title'] != null
                                        ? trendingMovies[index]['title']
                                        : 'loading',
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
