
import 'package:flutter/material.dart';
import 'package:flutter_study2/Day-1/clean_architecture_demo/data/repositories/product_repository_impl.dart';
import 'package:flutter_study2/Day-1/clean_architecture_demo/data/repositories/user_repository_impl.dart';
import 'package:flutter_study2/Day-1/clean_architecture_demo/domain/entities/user.dart';
import 'package:flutter_study2/Day-1/clean_architecture_demo/presentation/controllers/product_controller.dart';
import 'package:flutter_study2/Day-1/clean_architecture_demo/presentation/controllers/user_controller.dart';

void main() {
  final productRepository = ProductRepositoryImpl();
  final userRepository = UserRepositoryImpl();

  final productController = ProductController(productRepository);
  final userController = UserController(userRepository);

  runApp(MyApp(productController, userController));
}

class MyApp extends StatelessWidget {
  final ProductController productController;
  final UserController userController;

  const MyApp(this.productController, this.userController, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clean Architecture Deom",
      home: HomeScreen(productController, userController),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ProductController productController;
  final UserController userController;
  const HomeScreen(this.productController, this.userController, {super.key});

  @override
  Widget build(BuildContext context) {
    final user = userController.getUser();
    final products = productController.getProduct();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Architecture Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              showUserProfile(context, user);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} added to cart'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void showUserProfile(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('User Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}'),
            Text('Age: ${user.age}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}