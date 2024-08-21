import 'package:stylish/features/main/domain/entities/feature_entity.dart';

class FeatureModel extends Feature {
  const FeatureModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
