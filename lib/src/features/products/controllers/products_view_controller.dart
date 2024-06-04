import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/features/products/models/product_model.dart';
import 'package:motasimfuad_wedevs/src/features/products/repository/products_repository.dart';

class ProductsViewController extends GetxController {
  final ProductsRepository _productsRepository = ProductsRepository();

  RxList<ProductModel> products = <ProductModel>[].obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  Future<List<ProductModel>> getProducts() async {
    final response = await _productsRepository.getLocalProducts();
    products.value = List<ProductModel>.from(
      response.map(
        (x) => ProductModel.fromJson(x),
      ),
    );

    return products;
  }
}
