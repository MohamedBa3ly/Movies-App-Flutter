
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../domain/entities/home/movie_home_entity.dart';

class TitleAndRatingDetails extends StatelessWidget {
  const TitleAndRatingDetails({super.key, required this.movieHomeEntity});
  final MovieHomeEntity movieHomeEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Movie Title & Year
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieHomeEntity.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                movieHomeEntity.year.split('-').first,
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ],
            ),
          ),

          /// Movie Rating
          Row(
            children: [
              RatingBarIndicator(
                rating: movieHomeEntity.rating / 2, // Convert to 5-star scale
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemSize: 20,
              ),
              const SizedBox(width: 5),
              Text(
                (movieHomeEntity.rating / 2).toStringAsFixed(1),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      );


  }
}