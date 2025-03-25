import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/home/movie_home_entity.dart';
import '../../../../navigation/screens.dart';

class MostSearchedDetails extends StatelessWidget {
  const MostSearchedDetails({super.key, required this.movies});

  final List<MovieHomeEntity> movies;


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height * .18;

    return SizedBox(
      height: 170, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: movies.length, // Number of items
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 9 ? 0 : 10), // Adds spacing between items except the last one
            child: InkWell(
              onTap: (){
                GoRouter.of(context).pushReplacement(InitialScreens.details, extra: movies[index] );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w500${movies[index].image}",
                  height: height,
                  width: 120,
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