import 'package:flutter_study2/clean_architecture_demo/domain/entities/product.dart';

// Domain Layer - Repository Interfaces
abstract class ProductRepository {
  List<Product> getProduct(); // 단일 상품이 아닌 목록을 반환하도록 변경
}
