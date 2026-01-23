class Farm {
  final String farmId;
  final String farmName;
  final double rating;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final double distance;
  final List<String> categories;

  Farm({
    required this.farmId,
    required this.farmName,
    required this.rating,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.categories,
  });
}

//This entity represents a farm and is independent of any data source or API.
