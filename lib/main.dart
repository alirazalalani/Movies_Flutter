import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import 'package:movies_app/widgets/topRated.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'widgets/tv.dart';
import 'widgets/trending.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: 'Movies',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = []; //popular tv show
  final String apiKey = '85bb1d83b4eb2e6e58a16a57b2ace09d';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NWJiMWQ4M2I0ZWIyZTZlNThhMTZhNTdiMmFjZTA5ZCIsInN1YiI6IjYxNWYzMDg2NGRmMjkxMDAyOWJkMTJkMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Uz1YrXNoBd6jl-oUvYGakgowJ0apFcq4kOioZfMLjw4';
  void loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: ConfigLogger(
        showLogs: true, //must be true than only all other logs will be shown
        showErrorLogs: true,
      ),
    );
    Map trendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResults = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResults['results'];
      topRatedMovies = topRatedResults['results'];
      tv = tvResults['results'];
    });
    print(trendingMovies);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            modifiedText(
              text: 'NETFLIX',
              color: Colors.red,
              size: 27.0,
            ),
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png',
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Tvee(tv: tv),
          TopRated(topRated: topRatedMovies),
          TrendingMovies(
            trendingMovies: trendingMovies,
          ),
        ],
      ),
    );
  }
}
