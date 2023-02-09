class UpdateBankDetailRequest {
  UpdateBankDetailsData? bankDetails;

  UpdateBankDetailRequest({this.bankDetails});

  UpdateBankDetailRequest.fromJson(Map<String, dynamic> json) {
    bankDetails = json['bankDetails'] != null
        ? new UpdateBankDetailsData.fromJson(json['bankDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankDetails'] = this.bankDetails;
    return data;
  }
}


class UpdateBankDetailsData {
  String? country;
  String? name;
  String? beneficiary;
  String? accountNo;
  String? iban;
  String? swiftCode;

  UpdateBankDetailsData(
      {this.country,
        this.name,
        this.beneficiary,
        this.accountNo,
        this.iban,
        this.swiftCode});

  UpdateBankDetailsData.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    name = json['name'];
    beneficiary = json['beneficiary'];
    accountNo = json['accountNo'];
    iban = json['iban'];
    swiftCode = json['swiftCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['name'] = this.name;
    data['beneficiary'] = this.beneficiary;
    data['accountNo'] = this.accountNo;
    data['iban'] = this.iban;
    data['swiftCode'] = this.swiftCode;
    return data;
  }
}
