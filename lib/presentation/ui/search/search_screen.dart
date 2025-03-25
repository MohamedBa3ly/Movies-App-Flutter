import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/presentation/manager/cubits/fetch_search_result_cubit/fetch_search_result_cubit.dart';
import '../../../navigation/screens.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search for movies...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white54),
            ),
            style: const TextStyle(color: Colors.white),
            autofocus: true,
            onChanged: (query) async {
              await BlocProvider.of<FetchSearchResultCubit>(context)
                  .fetchSearchResult(query);
            },
          ),
        ),
        body: BlocBuilder<FetchSearchResultCubit, FetchSearchResultState>(
          builder: (context, state) {

            if(state is FetchSearchResultSuccess){
              if (state.movies.isEmpty) {
                return const Center(
                  child: Text(
                    "No movies found",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              }

              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: Image.network(
                        'https://image.tmdb.org/t/p/w500${state.movies[index].image}', // Adjust according to API
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                      title:  Text(state.movies[index].title),
                      // Adjust according to API
                      subtitle: Text(state.movies[index].year.split('-').first, style: Styles.style11,),
                      // Adjust according to API
                      onTap: () {
                        GoRouter.of(context).push(InitialScreens.details, extra: state.movies[index]);
                      },
                    ),
                  );
                },
              );
            }else if (state is FetchSearchResultFailure) {
              return Text(state.errMessage);
            }else if(state is FetchSearchResultInitial){
              return const Center(
                child: Text(
                  "Search for Movies",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            }
            else {
              return const Center(child: CircularProgressIndicator());
            }

          },
        )
    );
  }
}
