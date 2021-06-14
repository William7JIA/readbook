class User {
  /*
  This class encapsulates the json response from the api
  {
      'userId': '1908789',
      'password': password,
      'name': 'Peter Clarke',
      'status': "23 March 2020 03:34 PM",
      'email': 'x7uytx@mundanecode.com'
  }
  */
  String _userId;
  String _password;
  String _name;
  String _status;
  String _email;
  String _role;

  // constructor
  User(
      {String userId,
      String password,
      String name,
      String status,
      String role,
      String email}) {
    this._userId = userId;
    this._password = password;
    this._name = name;
    this._name = role;
    this._status = status;
    this._email = email;
  }

  // Properties
  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get password => _password;
  set password(String password) => _password = password;
  String get name => _name;
  set name(String name) => _name = name;
  String get status => _status;
  set status(String status) => _status = status;
  String get email => _email;
  set email(String email) => _email = email;
  String get role => _role;
  set role(String role) => _email = role;

  // create the user object from json input
  User.fromJson(Map<String, dynamic> json) {
    _userId = json['_id'];
    _password = json['password'];
    _name = json['nama'];
    _status = json['status'];
    _email = json['email'];
    _role = json['email'];
  }

  // exports to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['password'] = this._password;
    data['name'] = this._name;
    data['status'] = this._status;
    data['email'] = this._email;
    data['role'] = this._role;
    return data;
  }
}
