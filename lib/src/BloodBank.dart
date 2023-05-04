
class BloodBank {
  int? branchId ;
  String? bloodbankName;
  String? fullNameOfBloodBank;
  String? recType;
  int? districtID;
  int? isRBTC;
  int? isInstalled;
  String? emailID;
  String? address;
  String? pincode;
  double latitude=0.0;
  double longitude=0.0;
  String? errorMessage;

  BloodBank(
      {required this.branchId ,
        this.bloodbankName,
        this.fullNameOfBloodBank,
        this.recType,
        this.districtID,
        this.isRBTC,
        this.isInstalled,
        this.emailID,
        this.address,
        this.pincode,
        required this.latitude,
        required this.longitude,
        this.errorMessage});

  BloodBank.fromJson(Map<String, dynamic> json) {
    branchId = json['branchId'];
    bloodbankName = json['bloodbankName'];
    fullNameOfBloodBank = json['full_Name_of_Blood_Bank'];
    recType = json['recType'];
    districtID = json['district_ID'];
    isRBTC = json['is_RBTC'];
    isInstalled = json['isInstalled'];
    emailID = json['email_ID'];
    address = json['address'];
    pincode = json['pincode'];
    latitude = json['latitude'].toDouble();
    longitude = json['longitude'].toDouble();
    errorMessage = json['error_Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchId'] = this.branchId;
    data['bloodbankName'] = this.bloodbankName;
    data['full_Name_of_Blood_Bank'] = this.fullNameOfBloodBank;
    data['recType'] = this.recType;
    data['district_ID'] = this.districtID;
    data['is_RBTC'] = this.isRBTC;
    data['isInstalled'] = this.isInstalled;
    data['email_ID'] = this.emailID;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['error_Message'] = this.errorMessage;
    return data;
  }
}