class MyProject {
  MyProject({this.name, this.id, this.active});
  String id;
  String name;
  bool active;

  MyProject.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['_id'];
    active = json['active'];
  }
}
