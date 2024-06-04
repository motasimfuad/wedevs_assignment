import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/features/products/models/product_model.dart';
import 'package:motasimfuad_wedevs/src/features/products/repository/products_repository.dart';
import 'package:motasimfuad_wedevs/src/utils/enums.dart';

class ProductsViewController extends GetxController {
  final ProductsRepository _productsRepository = ProductsRepository();

  RxList<ProductModel> products = <ProductModel>[].obs;

  // ignore: cast_from_null_always_fails
  Rx<ProductFilters?> selectedFilter = (null as ProductFilters?).obs;

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
    filterProducts();
    return products;
  }

  void filterProducts() {
    if (selectedFilter.value == null) {
      return;
    }

    switch (selectedFilter.value!) {
      case ProductFilters.newest:
        products.sort((a, b) => a.dateCreated!.compareTo(b.dateCreated!));
        break;

      case ProductFilters.oldest:
        products.sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
        break;

      case ProductFilters.priceLow:
        products.sort((a, b) => double.parse(a.price ?? '0')
            .compareTo(double.parse(b.price ?? '0')));
        break;

      case ProductFilters.priceHigh:
        products.sort((a, b) => double.parse(b.price ?? '0')
            .compareTo(double.parse(a.price ?? '0')));
        break;

      case ProductFilters.bestSelling:
        products
            .sort((a, b) => (b.totalSales ?? 0).compareTo(a.totalSales ?? 0));
        break;
    }
  }
}
