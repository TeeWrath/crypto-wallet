class UserModel {
  UserModel({
    required this.status,
    required this.balance,
    required this.token,
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isVerified,
    required this.role,
    required this.ownerId,
    required this.walletAddress,
    required this.hasWallet,
    required this.profileImage
  });
  String status;
  int balance;
  String token;
  String userName ;
  String email ;
  String firstName ;
  String lastName ;
  bool isVerified ;
  String role ;
  String ownerId ;
  String walletAddress ;
  bool hasWallet ;
  String profileImage ;
}
