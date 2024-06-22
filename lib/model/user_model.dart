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
    required this.profileImage,
  });

  String status;
  int balance;
  String token;
  String userName;
  String email;
  String firstName;
  String lastName;
  bool isVerified;
  String role;
  String ownerId;
  String walletAddress;
  bool hasWallet;
  String profileImage;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json['status'],
      balance: json['balance'],
      token: json['token'],
      userName: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      isVerified: json['isVerified'],
      role: json['role'],
      ownerId: json['owner_id'],
      walletAddress: json['wallet_address'],
      hasWallet: json['has_wallet'],
      profileImage: json['profile_picture_url'],
    );
  }
}
