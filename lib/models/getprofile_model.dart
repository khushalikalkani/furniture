class GetProfile {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  bool? isAdmin;
  bool? isDelete;
  int? iV;

  GetProfile(
      {this.sId,
        this.name,
        this.email,
        this.password,
        this.confirmPassword,
        this.isAdmin,
        this.isDelete,
        this.iV});

 factory GetProfile.fromJson(Map<String, dynamic> json) {
   return GetProfile(
        sId : json['_id'],
        name : json['name'],
        email : json['email'],
    password : json['password'],
    confirmPassword : json['confirmPassword'],
    isAdmin : json['isAdmin'],
    isDelete : json['isDelete'],
    iV : json['__v'],
    );
  }

}
