class ToDoDataModel {
  final String title;
  final String date;
  bool isDone ;

  ToDoDataModel({required this.title, required this.date,this.isDone=false});

  factory ToDoDataModel.fromJson(Map<String, dynamic> json) {
    return ToDoDataModel(
      title: json['title'] ?? 'no title',
      date: json['due_date'] ?? 'no date',
    );
  }

  Map<String, String> toJson() {
    return {
      'title': title,
      'due_date': date,
    };
  }
}
