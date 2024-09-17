import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/data/model/dua_model.dart';
import 'package:taalim/src/presentation/dua/dua_detail/dua_detail_view.dart';

class FavoritesView extends StatelessWidget {
  final List<DuaModel> allDuaModels; // Pass all available DuaModels

  FavoritesView(this.allDuaModels);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: BlocBuilder<FavoritesCubit, List<String>>(
        builder: (context, favorites) {
          // Filter the favorites from all available DuaModels
          final favoriteDuas =
              allDuaModels.where((dua) => favorites.contains(dua.id)).toList();

          if (favoriteDuas.isEmpty) {
            return Center(
              child: Text('No favorites added yet.'),
            );
          }

          return ListView.builder(
            itemCount: favoriteDuas.length,
            itemBuilder: (context, index) {
              final dua = favoriteDuas[index];
              return ListTile(
                title: Text(dua.title ?? 'Unknown Dua'),
                onTap: () {
                  // Navigate to the detailed view of the selected favorite
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DuaDetailView(dua)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
