import 'package:project/feature/home/data/model/response/home_slider_response.dart';
import 'package:project/feature/home/domain/model/home_slider_model.dart';
import 'package:project/utils/constant/image_constant.dart';

extension SliderMapper on SliderResponse? {
  SliderModel toSilderModel() => SliderModel(
        slides: this?.slides ?? [ImageConstant.default_image_network],
        name: this?.name ?? "No Name",
        description: this?.description ?? "No Description",
        facebook: this?.facebook ?? "",
        telegram: this?.telegram ?? "",
        tiktok: this?.tiktok ?? "",
        youtube: this?.youtube ?? "",
        email: this?.email ?? "",
        phoneNumbers: this?.phoneNumbers ?? [""],
      );
}
