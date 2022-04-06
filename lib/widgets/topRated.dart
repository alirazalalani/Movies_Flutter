import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import 'package:movies_app/description.dart';

class TopRated extends StatelessWidget {
  final List topRated;
  const TopRated({Key? key, required this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(
            text: 'Top Rated Movies',
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
                itemCount: topRated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Description(
                            name: topRated[index]['title'],
                            description: topRated[index]['overview'],
                            bannerURL: 'https://image.tmdb.org/t/p/w500' +
                                topRated[index]['backdrop_path'],
                            posterURL: 'https://image.tmdb.org/t/p/w500' +
                                topRated[index]['poster_path'],
                            vote: topRated[index]['vote_average'].toString(),
                            launch_on: topRated[index]['release_date']);
                      }));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      topRated[index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: modifiedText(
                              text: topRated[index]['title'] != null
                                  ? topRated[index]['title']
                                  : 'loading',
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
