import 'package:flutter/material.dart';
import '../data/products.dart';
import '../data/cart.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favs = products.where((e) => e.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Favoriler")),
      body: favs.isEmpty
          ? Center(child: Text("Favori ürün yok"))
          : ListView.separated(
              itemCount: favs.length,
              separatorBuilder: (_, __) => Divider(height: 1),
              itemBuilder: (_, i) {
                return ListTile(
                  leading: Image.asset(favs[i].image, width: 60),
                  title: Text(favs[i].title),
                  subtitle: Text("${favs[i].price} ₺"),
                  trailing: ElevatedButton(
                    onPressed: () {
                      cart.add(favs[i]);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Sepete eklendi")),
                      );
                    },
                    child: Text("Sepete Ekle"),
                  ),
                );
              },
            ),
    );
  }
}