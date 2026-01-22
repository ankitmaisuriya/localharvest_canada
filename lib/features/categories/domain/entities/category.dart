import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String? imageUrl;
  final String? description;

  const Category({
    required this.id,
    required this.name,
    this.imageUrl,
    this.description,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, imageUrl, description];
}
