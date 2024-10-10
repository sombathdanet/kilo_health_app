import 'package:project/feature/home/domain/model/home_grid_item_model.dart';
import 'package:project/feature/home/domain/model/home_slider_model.dart';

class HomeState {
  int currentIndex = 0;
  int currentPageIndex = 0;
  List<HomeGridModel> homeGridItem = [];
  SliderModel sliderItem = FakeInit.sliderInit;
  double offset = 0.0;
  bool isFetchingData = false;
  String? message;
}

class FakeInit {
  static SliderModel sliderInit = SliderModel(
    slides: [],
    name: "",
    description: "",
    facebook: "",
    telegram: "",
    tiktok: "",
    youtube: "",
    email: "",
    phoneNumbers: [""],
  );
}
