import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/presentation/widgets/infinite_list/infinite_list_view.dart';

class RoomInfoItemCell with Datasource<RoomInfoData> {
  RoomInfoItemCell(this._roomInfoData);
  @override
  RoomInfoData get getData => _roomInfoData;

  final RoomInfoData _roomInfoData;
}

class RoomInfoData {
  RoomInfoData({
    required this.articleEntity,
  });

  final ArticleEntity articleEntity;
}
