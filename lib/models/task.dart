class Task {
  int? id;
  String? title;
  DateTime? date;
  String? subtitle;
  bool? isChecked = false;

  Task({
    required this.title,
    required this.date,
    required this.subtitle,
    required this.isChecked,
    this.id,
  });

  // Convert JSON to Task
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      date:json['dateTime']==null ? null:  DateTime.parse(json['dateTime']),
      subtitle: json['subTitle'],
      isChecked: json['isChecked']==0?false:true,
    );
  }

  // Convert Task to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'dateTime': date?.toIso8601String(),
      'subTitle': subtitle,
      'isChecked': isChecked==false?0 :1,
      //mahsadl
    };
  }
}
