import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/presentation/ui/login/widgets/login_card.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Movie App",style: Styles.style22Red,)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: const Column(
        children: [
          // Centered Title
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                "Who's Watching ?",
                style: Styles.style18,
              ),
            ),
          ),

          // Expanded GridView
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: LogInCard()
            ),
          ),
        ],
      ),
    );
  }
}
