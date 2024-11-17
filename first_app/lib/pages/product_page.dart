import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/exportation.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final List<PriceButtonModel> priceButtons;

  const ProductPage({required this.title, required this.priceButtons, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.7,
                ),
                itemCount: priceButtons.length,
                itemBuilder: (context, index) {
                  final product = priceButtons[index];
                  return Consumer<OrderState>(
                    builder: (context, orderState, _) {
                      return ElevatedButton(
                        onPressed: () {
                          orderState.addActivity(
                            '${product.name} ${product.price.toStringAsFixed(2)}€',
                            product.price,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: product.color,
                          foregroundColor: Colors.black,
                          side: BorderSide(color: Colors.black, width: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(product.name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            Text('${product.price.toStringAsFixed(2)}€',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
