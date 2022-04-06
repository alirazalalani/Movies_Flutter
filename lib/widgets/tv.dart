import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';

import '../description.dart';

class Tvee extends StatelessWidget {
  final List tv;
  const Tvee({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(
            text: 'Popular TV Shows',
            size: 26,
            color: Colors.red,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Description(
                            name: tv[index]['name'],
                            description: tv[index]['overview'],
                            bannerURL: 'https://image.tmdb.org/t/p/w500' +
                                tv[index]['backdrop_path'],
                            posterURL: 'https://image.tmdb.org/t/p/w500' +
                                tv[index]['poster_path'],
                            vote: tv[index]['vote_average'].toString(),
                            launch_on: tv[index]['first_air_date']);
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['backdrop_path'],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: modifiedText(
                              text: tv[index]['name'] != null
                                  ? tv[index]['name']
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
