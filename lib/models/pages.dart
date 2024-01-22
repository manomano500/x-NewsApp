class Pages {
  int? id;
  String? title;
  String? link;
  String? image;
  String? content;
  Pages( {
    this.id,
    this.title,
    this.link,
    this.content,
    // this.image
  });
  factory Pages.fromJson(Map<String, dynamic> json) {
    return Pages(

      id: json['id'] ?? 0,
      link: json['link'] ?? 0,
      title: json['title']['rendered'] ?? '',
      content: json['content']['rendered'] ?? '',
      // image: json['_embedded']['wp:featuredmedia'][0]['media_details']['file']
    );
  }
}

