class Account{
  String? name;
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;

  Account({this.name, this.email, this.password});
  Account.from({this.name, this.email,this.phone,this.password,this.confirmPassword});

  Account.fromJson(Map<String, dynamic> json)
  : name = json['name'],
    email = json ['email'],
    phone = json ['phone'],
    password = json ['password'],
    confirmPassword = json ['confirmPassword'];

  Map<String, dynamic> toJson() => {
    'name' : name,
    'email' : email,
    'phone' : phone,
    'password' : password,
    'confirmPassword' : confirmPassword,
  };

}