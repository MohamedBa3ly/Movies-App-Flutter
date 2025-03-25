import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/colors.dart';
import 'package:movies_app/data/repository/movie_repository_impl.dart';
import 'package:movies_app/domain/entities/home/movie_home_entity.dart';
import 'package:movies_app/domain/use_cases/details/fetch_most_searched_use_case.dart';
import 'package:movies_app/domain/use_cases/home/fetch_home_action_use_case.dart';
import 'package:movies_app/domain/use_cases/home/fetch_home_image_use_case.dart';
import 'package:movies_app/domain/use_cases/home/fetch_home_trending_now_use_case.dart';
import 'package:movies_app/navigation/screens.dart';
import 'package:movies_app/presentation/manager/cubits/fetch_home_action_cubit/fetch_home_action_cubit.dart';
import 'package:movies_app/presentation/manager/cubits/fetch_home_image_cubit/fetch_home_image_cubit.dart';
import 'package:movies_app/presentation/manager/cubits/fetch_home_trending_cubit/fetch_home_trending_cubit.dart';
import 'package:movies_app/presentation/manager/cubits/fetch_most_searched_cubit/fetch_most_searched_cubit.dart';
import 'package:movies_app/presentation/ui/details/details_screen.dart';
import 'package:movies_app/presentation/ui/search/search_screen.dart';
import '../core/utils/service_locator.dart';
import '../domain/use_cases/search/fetch_search_result_use_case.dart';
import '../presentation/manager/cubits/fetch_search_result_cubit/fetch_search_result_cubit.dart';
import '../presentation/ui/home/home_screen.dart';
import '../presentation/ui/login/login_screen.dart';
import '../presentation/ui/splash/splash_screen.dart';

class NavGraph extends StatelessWidget {
  const NavGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FetchHomeImageCubit(FetchHomeImageUseCase(getIt.get<MovieRepositoryImpl>()))..fetchHomeImage()
        ),
        BlocProvider(create: (context) => FetchHomeTrendingCubit(FetchHomeTrendingNowUseCase(getIt.get<MovieRepositoryImpl>()))..fetchHomeTrending()
        ),
        BlocProvider(create: (context) => FetchHomeActionCubit(FetchHomeActionUseCase(getIt.get<MovieRepositoryImpl>()))..fetchHomeAction()
        ),
        BlocProvider(create: (context) => FetchSearchResultCubit(FetchSearchResultUseCase(getIt.get<MovieRepositoryImpl>()))
        ),


      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.appColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: InitialScreens.splash,
  routes: [
    GoRoute(
      path: InitialScreens.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: InitialScreens.login,
      name: 'login',
      builder: (context, state) => const LogInScreen(),
    ),
    GoRoute(
      path: InitialScreens.details,
      name: 'details',
      builder: (context, state) =>  BlocProvider(
        create: (context) => FetchMostSearchedCubit(FetchMostSearchResultUseCase(getIt.get<MovieRepositoryImpl>())),
        child: DetailsScreen(movieHomeEntity: state.extra as MovieHomeEntity),
),
    ),
    GoRoute(
      path: InitialScreens.search,
      name: 'search',
      builder: (context, state) => SearchScreen(),
    ),

    /// ✅ **ShellRoute for Bottom Navigation Screens**
    ShellRoute(
      builder: (context, state, child) {
        return MainScreen(child: child);
      },
      routes: [
        GoRoute(
          path: BottomNavigationScreen.home.route,
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    ),
  ],
);
class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    BottomNavigationScreen.home.route,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // ✅ Navigate to the corresponding route
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: widget.child, // ✅ Displays the active screen from ShellRoute
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
