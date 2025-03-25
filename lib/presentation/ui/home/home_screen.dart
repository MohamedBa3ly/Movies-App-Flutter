import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/manager/cubits/fetch_home_action_cubit/fetch_home_action_cubit.dart';
import 'package:movies_app/presentation/manager/cubits/fetch_home_image_cubit/fetch_home_image_cubit.dart';
import 'package:movies_app/presentation/manager/cubits/fetch_home_trending_cubit/fetch_home_trending_cubit.dart';
import 'package:movies_app/presentation/ui/home/widgets/action_movie.dart';
import 'package:movies_app/presentation/ui/home/widgets/home_image.dart';
import 'package:movies_app/presentation/ui/home/widgets/trending_movie.dart';
import '../../../core/widgets/shimmers/shimmer_loading_container.dart';
import '../../../core/widgets/shimmers/shimmer_loading_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            BlocBuilder<FetchHomeImageCubit, FetchHomeImageState>(
              builder: (context, state) {
                if (state is FetchHomeImageSuccess) {
                  final randomIndex = (state.movies.length > 1) ? (state.movies..shuffle()).first : state.movies[0];
                  String image = "https://image.tmdb.org/t/p/w500${randomIndex.image}";
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HomeImage(image: image),
                  );
                } else if (state is FetchHomeImageFailure) {
                  return Text(state.errMessage);
                } else {
                  // return const Center(child: CircularProgressIndicator());
                  return ShimmerLoadingContainer(height: MediaQuery.of(context).size.height *.65, width: double.infinity);
                }
              },
            ),


            // Trending Now Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "Trending Now",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // Horizontal Scroll View for Trending Movies
            BlocBuilder<FetchHomeTrendingCubit, FetchHomeTrendingState>(
              builder: (context, state) {
                if (state is FetchHomeTrendingSuccess) {
                  return TrendingMovie(movies: state.movies);
                } else if (state is FetchHomeTrendingPaginationLoading) {
                  return TrendingMovie(movies: state.movies);
                }else if( state is FetchHomeTrendingPaginationFailure){
                  return TrendingMovie(movies: state.movies);
                }
                else if (state is FetchHomeTrendingFailure) {
                  return Text(state.errMessage);
                } else {
                  // return const Center(child: CircularProgressIndicator());
                  return const ShimmerMovieList();
                }
              },
            ),


            // Trending Now Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "Action",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // Horizontal Scroll View for Action Movies
            BlocBuilder<FetchHomeActionCubit, FetchHomeActionState>(
              builder: (context, state) {
                if (state is FetchHomeActionSuccess) {
                  return ActionMovie(movies: state.movies);
                } else if (state is FetchHomeActionFailure) {
                  return Text(state.errMessage);
                } else {
                  // return const Center(child: CircularProgressIndicator());
                  return const ShimmerMovieList();
                }
              },
            ),

            const SizedBox(height: 4),

          ],
        ),
      ),
    );
  }
}



