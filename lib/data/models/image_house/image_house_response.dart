import 'package:batru_house_rental/domain/entities/image_house/image_house_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_house_response.g.dart';

@JsonSerializable()
class ImageHouseResponse {
  ImageHouseResponse({
    required this.id,
    required this.houseId,
    required this.url,
  });

  factory ImageHouseResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageHouseResponseFromJson(json);

  final String id;
  final String houseId;
  final String url;

  Map<String, dynamic> toJson() => _$ImageHouseResponseToJson(this);

  ImageHouseEntity toEntity() => ImageHouseEntity(
        id: id,
        houseId: houseId,
        url: url,
      );
}
