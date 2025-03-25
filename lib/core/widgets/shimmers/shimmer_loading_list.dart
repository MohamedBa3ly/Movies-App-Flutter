import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMovieList extends StatelessWidget {
  const ShimmerMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 5, // Placeholder items
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[500]!,
              child: Container(
                height: 170,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
