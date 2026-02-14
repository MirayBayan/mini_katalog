import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/cart.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  DetailPage({required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(widget.product.image, height: 200),
            ),
            SizedBox(height: 10),

            Text(
              widget.product.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            Text(
              "${widget.product.price} ₺",
              style: TextStyle(fontSize: 18),
            ),

            Row(
              children: [
                IconButton(
                  icon: Icon(
                    widget.product.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.product.isFavorite =
                          !widget.product.isFavorite;
                    });
                  },
                ),

                Spacer(),

                ElevatedButton(
                  onPressed: () {
                    cart.add(widget.product);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Sepete eklendi")),
                    );
                  },
                  child: Text("Sepete Ekle"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}