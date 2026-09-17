class CourseDetailModel {
  bool? active;
  String? name;
  String? courseId;

  CourseDetailModel({this.active, this.name, this.courseId});

  // receiving data from server
  factory CourseDetailModel.fromMap(map) {
    return CourseDetailModel(
      active: map['active'],
      name: map['name'],
      courseId: map.id,
    );
  }

  factory CourseDetailModel.fromMapNew(map) {
    return CourseDetailModel(
      active: map['active'],
      name: map['name'],
      courseId: map['id'],
    );
  }
}
