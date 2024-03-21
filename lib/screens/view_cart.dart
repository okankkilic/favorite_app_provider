import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20.0,
          left: 20.0,
          top: 10,
        ),
        child: Provider.of<CartModel>(context).items.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Nothing in cart',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Add items to cart',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.add_shopping_cart,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ],
                  )
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Hey there check \nyour items in cart',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.71,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 20,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Name',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height:
                                (MediaQuery.of(context).size.height * 0.74) -
                                    100,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: Consumer<CartModel>(
                                    builder: (context, cart, child) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            cart.items[index].name,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount:
                                  Provider.of<CartModel>(context).items.length,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  'Total Price',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                    '${Provider.of<CartModel>(context, listen: false).totalPrice}')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<CartModel>(context, listen: false)
                            .clearItem();
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Clear Cart',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
