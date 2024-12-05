void main() {
  final productRepository = InMemoryProductRepository();
  final addProductUseCase = AddProductUseCase(productRepository);
  final getProductUseCase = GetProductUseCase(productRepository);

  final mockRepository = MockProductRepository();
  final mockAddProductUseCase = AddProductUseCase(productRepository);
  final mockGetProductUseCase = GetProductUseCase(productRepository);

  // 여러 제품 저장
  final mockProduct1 = Product(id: 1, name: ' Product1', price: 999.0);
  final mockProduct2 = Product(id: 2, name: ' Product2', price: 899.0);
  final mockProduct3 = Product(id: 3, name: ' Product3', price: 799.0);

  // 실제 저장소에 제품 추가
  addProductUseCase.execute(mockProduct1);
  addProductUseCase.execute(mockProduct2);
  addProductUseCase.execute(mockProduct3);

  // 모의 저장소에 제품 추가
  mockAddProductUseCase.execute(mockProduct1);
  mockAddProductUseCase.execute(mockProduct2);
  mockAddProductUseCase.execute(mockProduct3);

  // 특정 제품 검색
  try {
    final seachProduct1 = getProductUseCase.execute(1);
    print('Product:  ${seachProduct1?.name} / ${seachProduct1?.price}');
    final seachProduct2 = getProductUseCase.execute(2);
    print('Product:  ${seachProduct2?.name} / ${seachProduct2?.price}');
    final seachProduct3 = getProductUseCase.execute(3);
    print('Product:  ${seachProduct3?.name} / ${seachProduct3?.price}');
  } catch (e) {
    print(e);
  }

  // Mock 저장소에서 제품 검색
  try {
    final seachProduct1 = mockGetProductUseCase.execute(1);
    print('ProductMock:  ${seachProduct1?.name} / ${seachProduct1?.price}');
    final seachProduct2 = mockGetProductUseCase.execute(2);
    print('ProductMock:  ${seachProduct2?.name} / ${seachProduct2?.price}');
    final seachProduct3 = mockGetProductUseCase.execute(3);
    print('ProductMock:  ${seachProduct3?.name} / ${seachProduct3?.price}');
  } catch (e) {
    print(e);
  }
}

class InMemoryProductRepository implements ProductRepository {
  final List<Product> _data = [];

  @override
  void saveProduct(Product product) {
    _data.add(product);
  }

  @override
  Product getProduct(int id) {
    return _data.firstWhere(
      (product) => product.id == id,
      orElse: () => throw Exception('Product not found'), // null 대신 예외 처리
    );
  }
}

class MockProductRepository implements ProductRepository {
  final List<Product> _mockData = [];

  @override
  void saveProduct(Product product) {}

  @override
  Product getProduct(int id) {
    return _mockData.firstWhere(
      (product) => product.id == id,
      orElse: () => throw Exception('Mock Product not found'), // null 대신 예외 처리
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}

abstract class ProductRepository {
  void saveProduct(Product product);

  Product? getProduct(int id);
}

class AddProductUseCase {
  final ProductRepository repository;

  AddProductUseCase(this.repository);

  void execute(Product product) {
    repository.saveProduct(product);
  }
}

class GetProductUseCase {
  final ProductRepository repository;

  GetProductUseCase(this.repository);

  Product? execute(int id) {
    return repository.getProduct(id);
  }
}
