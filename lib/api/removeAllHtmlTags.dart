String removeAllHtmlTags(String htmlText) {
  // Remove HTML tags
  RegExp expTags = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: false);
  String contentWithoutTags = htmlText.replaceAll(expTags, '');

  // Remove HTML entities like &#8217;
  RegExp expEntities = RegExp(r'&#\d+;');
  String contentWithoutEntities = contentWithoutTags.replaceAll(expEntities, '');

  // Remove extra whitespaces
  String contentWithoutExtraWhitespaces = contentWithoutEntities.replaceAll(RegExp(r'\s+'), ' ');

  return contentWithoutExtraWhitespaces.trim(); // Trim to remove leading/trailing spaces
}
