import 'package:flutter/material.dart';
import 'package:flutter_getx_test/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ShoppingPage({Key? key})
      : super(
            key:
                key); // Create controller (shoppingController) and put it in the dependency (Get.put)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(controller
                                        .products[index].productDescription),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController.cartItems
                                    .add(controller.products[index]);
                              },
                              child: const Text('Add to Cart'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text('Total amount: ${controller.totalPrice}');
            }),
            const SizedBox(
              height: 200,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text('${controller.count}');
        }),
        icon: const Icon(
          Icons.add_shopping_cart_outlined,
        ),
      ),
    );
  }
}
