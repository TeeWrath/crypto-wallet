class WalletModel {
  WalletModel(
      {required this.status,
      required this.message,
      required this.walletName,
      required this.userPin,
      required this.network,
      required this.publicKey,
      required this.secretKey});

  String status;
  String message;
  String walletName;
  String userPin;
  String network;
  String publicKey;
  String secretKey;

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      status: json['status'],
      message: json['message'],
      walletName: json['walletName'],
      userPin: json['userPin'],
      network: json['network'],
      publicKey: json['publicKey'],
      secretKey: json['secretKey']
    );
  }
}
