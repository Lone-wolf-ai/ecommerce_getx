import 'package:get/get.dart';
import 'package:getx_ecommerce/data/model/bannermodel.dart';
import 'package:getx_ecommerce/data/repo/bannerrepo.dart/bannerrepo.dart';
import 'package:getx_ecommerce/utils/popups/loaders.dart';

class BannerController extends GetxController {
  /// Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel>banners=<BannerModel>[].obs;
  ///for fetch automatically
  @override
  void onInit() {
    // TODO: implement onInit
    fetchBanners();
    super.onInit();
  }
  
  /// Update Page Navigational Dots
  void updatePageIndicator(int index) {
    carousalCurrentIndex.value = index; // Update the index using the value
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Implement API call or logic to fetch banners here
      final bannerRepo=Get.put(BannerRepository());
      final banners=await bannerRepo.fetchBanners();
      // Replace with your actual banner fetching logic
      this.banners.assignAll(banners);
      // You might use a service or repository to fetch data

    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
