class UserModel {
  String? userId;
  String? guide;
  String? createdDate;
  String? name;
  String? city;
  String? country;
  String? emailphone = "";
  String? phone = "";
  String? email = "";
  String? address = "";
  String? state = "";
  String? pincode = "";
  String? panNumber = "";
  String? gothram = "";
  List? courses;
  List? bharatCourses;
  //List? homaCourses;
  Map? devicesList = {};
  String? profileImgUrl;

  UserModel({
    this.userId,
    this.guide,
    this.createdDate,
    this.name,
    this.city,
    this.country,
    this.emailphone,
    this.phone,
    this.email,
    this.address,
    this.state,
    this.pincode,
    this.panNumber,
    this.gothram,
    this.courses,
    this.bharatCourses,
    // this.homaCourses,
    this.devicesList,
    this.profileImgUrl,
  });

  // receiving data from server
  factory UserModel.fromMap(mapItems) {
    var map = mapItems.data();
    return UserModel(
      userId: mapItems.id,
      guide: ((map['guide'] != null) ? map['guide'] : "Aravind Dasa"),
      city: ((map['city'] != null) ? map['city'] : ""),
      name: ((map['name'] != null) ? map['name'] : ""),
      createdDate: ((map['createdDate'] != null) ? map['createdDate'] : ""),
      country: ((map['country'] != null) ? map['country'] : "India"),
      emailphone:
          ((map['phone'] != null) ? map['phone'] : "") +
          // ignore: prefer_interpolation_to_compose_strings
          "" +
          ((map['email'] != null) ? map['email'] : ""),
      phone: ((map['phone'] != null) ? map['phone'] : ""),
      email: ((map['email'] != null) ? map['email'] : ""),
      address: ((map['address'] != null) ? map['address'] : ""),
      state: ((map['state'] != null) ? map['state'] : ""),
      pincode: ((map['pincode'] != null) ? map['pincode'] : ""),
      panNumber: ((map['panNumber'] != null) ? map['panNumber'] : ""),
      gothram: ((map['gothram'] != null) ? map['gothram'] : ""),
      courses: ((map['courses'] != null) ? map['courses'] : ['free']),
      bharatCourses:
          ((map['bharatCourses'] != null) ? map['bharatCourses'] : ['free']),
      devicesList: ((map['devices_list'] != null) ? map['devices_list'] : {}),
      profileImgUrl: map['profile_image'],
    );
  }
}
