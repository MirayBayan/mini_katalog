import 'package:flutter/material.dart';
import '../data/cart.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double getTotal() {
    double total = 0;
    for (var item in cart) {
      total += item.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sepet")),
      body: cart.isEmpty
          ? Center(child: Text("Sepet boş"))
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cart.length,
                    separatorBuilder: (_, __) => Divider(height: 1),
                    itemBuilder: (_, i) {
                      return ListTile(
                        leading: Image.asset(cart[i].image, width: 60),
                        title: Text(cart[i].title),
                        trailing: Text("${cart[i].price} ₺"),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        "Toplam: ${getTotal()} ₺",
                        style: TextStyle(fontSize: 14),
                      ),

                      Spacer(),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                        onPressed: () {
                          setState(() {
                            cart.clear();
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Sipariş alındı 🎉")),
                          );
                        },
                        child: Text(
                          "Sepeti Onayla",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}