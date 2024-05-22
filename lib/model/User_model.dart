class Usermodel {
  static final Usermodel _instance = Usermodel._internal();

  factory Usermodel() {
    return _instance;
  }

  Usermodel._internal();

  String name = '';
  String phone = '+880131';
  String userID = '123';
  String password = '';

  // Setter methods
  void setName(String name) {
    this.name = name;
  }

  void setPhone(String phone) {
    this.phone = phone;
  }

  void setUserID(String userID) {
    this.userID = userID;
  }

  void setPassword(String password) {
    this.password = password;
  }

  // Getter methods
  String getName() {
    return name;
  }

  String getPhone() {
    return phone;
  }

  String getUserID() {
    return userID;
  }

  String getPassword() {
    return password;
  }
}
