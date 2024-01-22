class Categories {
  int? id;
  String? name;
  Categories( {
    this.id,
    this.name
});
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(

      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

