
import '../../data/repositories/product_repository.dart';
import '../models/product.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> call() async {
    return await repository.fetchProducts();
  }
} 