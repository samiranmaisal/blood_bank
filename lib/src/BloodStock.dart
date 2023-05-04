class BloodStock {
  String? productName;
  String? grpANegative;
  String? grpAPositive;
  String? grpABNegative;
  String? grpABPositive;
  String? grpBNegative;
  String? grpBPositive;
  String? grpONegative;
  String? grpOPositive;
  String? grpOHNegative;
  String? grpOHPositive;
  int? total;
  String? nameOfBloodBank;
  String? errorMessage;

  BloodStock(
      {this.productName,
        this.grpANegative,
        this.grpAPositive,
        this.grpABNegative,
        this.grpABPositive,
        this.grpBNegative,
        this.grpBPositive,
        this.grpONegative,
        this.grpOPositive,
        this.grpOHNegative,
        this.grpOHPositive,
        this.total,
        this.nameOfBloodBank,
        this.errorMessage});

  BloodStock.fromJson(Map<String, dynamic> json) {
    productName = json['product_Name'];
    grpANegative = json['grp_A_Negative'];
    grpAPositive = json['grp_A_Positive'];
    grpABNegative = json['grp_AB_Negative'];
    grpABPositive = json['grp_AB_Positive'];
    grpBNegative = json['grp_B_Negative'];
    grpBPositive = json['grp_B_Positive'];
    grpONegative = json['grp_O_Negative'];
    grpOPositive = json['grp_O_Positive'];
    grpOHNegative = json['grp_OH_Negative'];
    grpOHPositive = json['grp_OH_Positive'];
    total = json['total'];
    nameOfBloodBank = json['name_of_Blood_Bank'];
    errorMessage = json['error_Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_Name'] = this.productName;
    data['grp_A_Negative'] = this.grpANegative;
    data['grp_A_Positive'] = this.grpAPositive;
    data['grp_AB_Negative'] = this.grpABNegative;
    data['grp_AB_Positive'] = this.grpABPositive;
    data['grp_B_Negative'] = this.grpBNegative;
    data['grp_B_Positive'] = this.grpBPositive;
    data['grp_O_Negative'] = this.grpONegative;
    data['grp_O_Positive'] = this.grpOPositive;
    data['grp_OH_Negative'] = this.grpOHNegative;
    data['grp_OH_Positive'] = this.grpOHPositive;
    data['total'] = this.total;
    data['name_of_Blood_Bank'] = this.nameOfBloodBank;
    data['error_Message'] = this.errorMessage;
    return data;
  }
}