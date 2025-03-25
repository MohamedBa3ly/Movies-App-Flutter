
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../navigation/screens.dart';

class LogInCard extends StatelessWidget {
  const LogInCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for grid items
    final List<Map<String, String>> items = [
      {"image": "assets/images/avatar_one.png", "title": "Mimi"},
      {"image": "assets/images/avatar_two.png", "title": "Amr"},
      {"image": "assets/images/avatar_three.png", "title": "Hisham"},
      {"image": "assets/images/avatar_four.png", "title": "Salma"},
      {"image": "assets/images/add_icon.png", "title": "Add"},
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7, // Adjust size ratio of items
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            if(index == items.length-1){

            }else{
              GoRouter.of(context).pushReplacement(BottomNavigationScreen.home.route);
            }

          },
          child: Card(
            color: Colors.grey[900], // Dark background for movie item
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(

              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      items[index]["image"]!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    items[index]["title"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}