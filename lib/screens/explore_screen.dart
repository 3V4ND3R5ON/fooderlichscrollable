import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  // 1.	Crie um MockFooderlichService, para simular as respostas do servidor.
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2.	Exibe um texto de espaço reservado. Você o substituirá mais tarde.
    // TODO 1: Add TodayRecipeListView FutureBuilder
    /*return const Center(
      child: Text('Explore Screen'),
    );*/
    // 1
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
      // 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // TODO: Add Nested List Views
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          final recipes = snapshot.data?.todayRecipes ?? [];
          // TODO: Replace this with TodayRecipeListView
          return Center(
            child: Container(
              child: const Text('Show TodayRecipeListView'),
            ),
          );
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
