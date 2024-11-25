import 'package:flutter_study2/clean_architecture_demo/domain/entities/product.dart';
import 'package:flutter_study2/clean_architecture_demo/domain/repositories/product_repository.dart';

// Presentation Layer - Controllers
class ProductController {
  final ProductRepository repository;
  ProductController(this.repository);

  List<Product> getProduct() {
    return repository.getProduct();
  }
}
