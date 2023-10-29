
class taskModel{
  String id;
  String title;
  String description;
  int date;
  bool isDone;
  String userId;

  taskModel({
    this.id="",
    required this.title,
    required this.description,
    required this.date,
    required this.userId,
    this.isDone=false});


  taskModel.fromjason(Map<String,dynamic>json)
  :this(
    id: json['id'],
    title: json["title"],
    description: json["description"],
    date: json["date"],
    userId: json["userId"],
    isDone: json["isDone"],
  );

  Map<String,dynamic>toJson(){
    return{
      "id":id,
      "title":title,
      "description":description,
      "date":date,
      "userId":userId,
      "isDone":isDone,
    };
 }
}