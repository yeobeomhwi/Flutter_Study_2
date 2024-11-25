import 'package:flutter/foundation.dart';
import '../../../domain/usecases/get_products_usecase.dart';
import '../../models/product.dart';


class ProductProvider extends ChangeNotifier {
  final GetProductsUseCase getProducts;

  List<Product> _products = [];
  bool _isLoading = true;
  String? _error;

  ProductProvider({required this.getProducts}) {
    loadProducts();
  }

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadProducts() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      
      _products = await getProducts();
      _isLoading = false;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
    }
    notifyListeners();
  }
} 