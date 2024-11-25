import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mvvm_demo_1/data/repositories/product_repository.dart';
import 'mvvm_demo_1/domain/usecases/get_products_usecase.dart';
import 'mvvm_demo_1/presentation/viewmodels/product_provider.dart';
import 'mvvm_demo_1/presentation/views/product_page.dart';

void main() {
  final productRepository = ProductRepository();
  final getProductsUseCase = GetProductsUseCase(productRepository);

  runApp(MyApp(getProductsUseCase: getProductsUseCase));
}

class MyApp extends StatelessWidget {
  final GetProductsUseCase getProductsUseCase;
  
  const MyApp({super.key, required this.getProductsUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(getProducts: getProductsUseCase),
        ),
      ],
      child: MaterialApp(
        title: 'Shopping Mall App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ProductPage(),
      ),
    );
  }
}
