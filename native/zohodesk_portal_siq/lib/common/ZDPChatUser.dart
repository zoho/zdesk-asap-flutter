
class ZDPChatUser{

  ZDPChatUser({required this.email, required this.name, required this.phone});

  final String email;
  final String name;
  final String phone;

  Map toJson() => {
    'email': email,
    'name': name,
    'phone': phone
  };

}