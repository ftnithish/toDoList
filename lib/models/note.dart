class Note {
  String title;
  String content;
  DateTime dateTime;

  Note({
    required this.title,
    required this.content,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      content: json['content'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}
