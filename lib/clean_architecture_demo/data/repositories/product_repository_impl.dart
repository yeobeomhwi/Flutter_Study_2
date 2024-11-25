import 'package:flutter_study2/clean_architecture_demo/domain/entities/product.dart';
import 'package:flutter_study2/clean_architecture_demo/domain/repositories/product_repository.dart';

// Data Layer - Repository Implementations
class ProductRepositoryImpl implements ProductRepository {
  @override
    List<Product> getProduct() {
    // 실제로는 데이터베이스나 API에서 데이터를 가져올 것입니다
    return [
      Product(name: 'Laptop', price: 999.99),
      Product(name: 'Smartphone', price: 129.99),
      Product(name: 'Headphones', price: 199.99),
      Product(name: '맥미니', price: 80.99),
    ];
  }
}
