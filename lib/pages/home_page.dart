import 'package:flutter/material.dart';
import '../data/products.dart';
import 'detail_page.dart';
import 'favorites_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mini Katalog"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FavoritesPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(product: product),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(child: Image.asset(product.image)),
                  SizedBox(height: 5),
                  Text(product.title),
                  Text("${product.price} ₺"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}