import 'package:favorite_app_provider/screens/view_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';

class MyCatalog extends StatelessWidget {
  List<Item> catalogitems = [
    Item(0, 'Apple', 4),
    Item(1, 'Egg', 12),
    Item(2, 'Oat', 5),
    Item(3, 'Bread', 2),
    Item(4, 'Yogurt', 3),
    Item(5, 'Avocado', 4),
    Item(6, 'Peanut Butter', 7),
    Item(7, 'Almond', 6),
    Item(8, 'Chocolate', 12),
    Item(9, 'Chia Seed', 15),
    Item(10, 'Banana', 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'What is your\nfavorite food?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.77,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            catalogitems[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          const Text(''),
                          GestureDetector(
                            onTap: () {
                              if (Provider.of<CartModel>(context, listen: false)
                                  .items
                                  .contains(catalogitems[index])) {
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItem(index, catalogitems[index]);
                              } else {
                                Provider.of<CartModel>(context, listen: false)
                                    .addItem(index, catalogitems[index]);
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Provider.of<CartModel>(context, listen: true)
                                        .items
                                        .contains(catalogitems[index])
                                    ? Icons.favorite_outlined
                                    : Icons.favorite_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  );
                },
                itemCount: catalogitems.length,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CartScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'View Cart',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
