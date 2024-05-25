// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentid;
  bool isfeatured;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.parentid,
    required this.isfeatured,
  });

  static CategoryModel empty()=>CategoryModel(id: '', name: '', image: '', parentid: '', isfeatured: false);

  CategoryModel copyWith({
    String? id,
    String? name,
    String? image,
    String? parentid,
    bool? isfeatured,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      parentid: parentid ?? this.parentid,
      isfeatured: isfeatured ?? this.isfeatured,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'parentid': parentid,
      'isfeatured': isfeatured,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      parentid: map['parentid'] as String,
      isfeatured: map['isfeatured'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, image: $image, parentid: $parentid, isfeatured: $isfeatured)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image &&
      other.parentid == parentid &&
      other.isfeatured == isfeatured;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      parentid.hashCode ^
      isfeatured.hashCode;
  }
}
