import 'package:get/get.dart';
import 'package:getx_ecommerce/data/repo/catagory/catagoryrepo.dart';
import 'package:getx_ecommerce/features/shop/models/categorymodel.dart';
import 'package:getx_ecommerce/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final isloading = false.obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  //at the time of initialize
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  ///--- Load Categories data
  Future<void> fetchCategories() async {
    try {
      //show loader while loading categories
      isloading.value = true;
      //Fetch categories from data source(firestore,api)
      final categories = await _categoryRepository.getAllCategories();
      //update the categories list
      allCategories.assignAll(categories);
      //filter featured categories
      featuredCategories.assignAll(
          allCategories.where((p0) => p0.isfeatured && p0.parentid.isEmpty).take(8).toList());
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
