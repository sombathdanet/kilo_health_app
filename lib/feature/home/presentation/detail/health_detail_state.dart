import 'package:project/feature/home/domain/model/home_grid_detail_model.dart';

class HealthDetailState {
  bool loading = false;
  HomeGridDetialModel homeGridDetialModel = HomeGridDetialModel(
    id: '',
    type: '',
    name: '',
    description: '',
    content: '',
    thumbnail: '',
    views: 0,
    status: '',
    favorite: false,
    createdAt: '',
    categories: [],
    tags: [],
  );
  HealthDetailState();
}
