import '../../domain/models/product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Product(id: '1', name: 'Product 1', price: 100.0),
      Product(id: '2', name: 'Product 2', price: 200.0),
      Product(id: '3', name: 'Product 3', price: 300.0),
    ];
  }
} 