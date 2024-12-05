import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/panier.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Cart _cart;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const AppbarWidget(this.title,this._cart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => Panier(_cart),
              ));
          },
          icon: Icon(Icons.shopping_cart)
        )
      ],
    );
  }
}