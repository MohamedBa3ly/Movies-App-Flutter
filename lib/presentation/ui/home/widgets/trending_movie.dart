import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/domain/entities/home/movie_home_entity.dart';
import 'package:movies_app/presentation/manager/cubits/fetch_home_trending_cubit/fetch_home_trending_cubit.dart';
import '../../../../navigation/screens.dart';

class TrendingMovie extends StatefulWidget {
  const TrendingMovie({super.key, required this.movies});

  final List<MovieHomeEntity> movies;

  @override
  State<TrendingMovie> createState() => _TrendingMovieState();
}

class _TrendingMovieState extends State<TrendingMovie> {
  late final ScrollController _scrollController;
  var nextPage = 2;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FetchHomeTrendingCubit>(context)
            .fetchHomeTrending(page: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170, // Adjust height as needed
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: widget.movies.length, // Number of items
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10), // Adds spacing between items
            child: InkWell(
              onTap: () {
                GoRouter.of(context).push(InitialScreens.details, extra: widget.movies[index]);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w500${widget.movies[index].image}",
                  height: 170,
                  width: 110,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
