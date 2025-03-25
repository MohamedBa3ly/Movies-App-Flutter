import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/entities/home/movie_home_entity.dart';
import 'package:movies_app/presentation/manager/cubits/fetch_most_searched_cubit/fetch_most_searched_cubit.dart';
import 'package:movies_app/presentation/ui/details/widgets/most_searched_details.dart';
import 'package:movies_app/presentation/ui/details/widgets/title_rating_details.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.movieHomeEntity});
  final MovieHomeEntity movieHomeEntity;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<FetchMostSearchedCubit>(context).fetchMostSearched();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///  Movie Poster (40% of screen height)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: screenHeight * 0.5,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: "https://image.tmdb.org/t/p/w500${widget.movieHomeEntity.image}",
                        height: screenHeight * 0.5,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                /// Movie Info Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TitleAndRatingDetails(movieHomeEntity:widget.movieHomeEntity),

                      const SizedBox(height: 16),

                      Text(
                        widget.movieHomeEntity.overView,
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                        maxLines: 2, // Limits the text to 5 lines
                        overflow: TextOverflow.ellipsis, // Adds "..." if text overflows
                      ),

                      // Trending Now Text
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Most Searched",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),

                      // Horizontal Scroll View for Trending Movies
                      BlocBuilder<FetchMostSearchedCubit, FetchMostSearchedState>(
                        builder: (context, state) {
                          if (state is FetchMostSearchedSuccess) {
                            return MostSearchedDetails(movies: state.movies);
                          } else if (state is FetchMostSearchedFailure) {
                            return Text(state.errMessage);
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),

                      const SizedBox(height: 2),

                    ],
                  ),
                ),
              ],
            ),
          )

        ],

      ),
    );
  }
}
