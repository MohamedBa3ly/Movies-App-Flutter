
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../navigation/screens.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight = screenHeight * 0.65; // 50% of screen height

    return // Custom AppBar with background image
      Stack(
        children: [

          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: image,
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),

          // Dark Gradient Overlay for better readability
          Container(
            height: imageHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          // App Bar Icons and Logo
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                const Icon(Icons.slow_motion_video, color: Colors.red, size: 32),

                // Search & Profile Icons
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () { GoRouter.of(context).push(InitialScreens.search);},
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/strange.png"), // Change to your image
                      radius: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Centered Navigation Texts
          Positioned(
            top: imageHeight * 0.19, // Positioning the text near the bottom of the image
            left: 0,
            right: 0,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("TV Shows", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Movies", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Categories", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // Bottom Icons (Bookmark, Play, Download)
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.bookmark_border, color: Colors.white, size: 28),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow, color: Colors.black),
                  label: const Text("Play Now", style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                ),
                const Icon(Icons.download, color: Colors.white, size: 28),
              ],
            ),
          ),
        ],
      );

  }
}