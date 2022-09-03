class Task{

  int? id;
  String? title;
  String? note;
  String? date;
  int? remind;

  Task({
    this.id,
    this.title,
    this.note,
    this.date,
    this.remind,



});
Task.fromJson(Map<String,dynamic>json){
  id=json['id'];
  title=json['title'];
  note=json['note'];
  date=json['date'];
  remind=json['remind'];
}
Map<String,dynamic> toJson(){
  final Map<String,dynamic> data = new Map<String,dynamic>();
  data['id']= this.id;
  data['title']= this.title;
  data['note']= this.note;
  data['date']= this.date;
  data['remind']=this.remind;

  return data;
}



}