void main() {}

class PlaySchoolDataModel {
  String? StudentName;
  String? FatherNamePhone;
  String? MotherName;
  String? AdmissionDate;
  int? FatherPhone;
  int? MotherPhone;
  String? AdmissionNo;
  String? BloodGroup;
  String? FatherAadhar;
  String? MotherAadhar;
  String? Address;
  //
  String? FeeTerm1;
  int? FeeAmountTerm1;
  String? FeePaymentDateTerm1;
  int? FeeReceiptNoTerm1;
  //
  String? FeeTerm2;
  int? FeeAmountTerm2;
  String? FeePaymentDateTerm2;
  int? FeeReceiptNoTerm2;
  //
  String? FeeTerm3;
  int? FeeAmountTerm3;
  String? FeePaymentDateTerm3;
  int? FeeReceiptNoTerm3;
  //
  String? FeeTerm4;
  int? FeeAmountTerm4;
  String? FeePaymentDateTerm4;
  int? FeeReceiptNoTerm4;
  //
  String? FeeTerm5;
  int? FeeAmountTerm5;
  String? FeePaymentDateTerm5;
  int? FeeReceiptNoTerm5;
  //
  String? FeeTerm6;
  int? FeeAmountTerm6;
  String? FeePaymentDateTerm6;
  int? FeeReceiptNoTerm6;
  //
  String? FeeTerm7;
  int? FeeAmountTerm7;
  String? FeePaymentDateTerm7;
  int? FeeReceiptNoTerm7;
  //
  String? FeeTerm8;
  int? FeeAmountTerm8;
  String? FeePaymentDateTerm8;
  int? FeeReceiptNoTerm8;
  //
  String? FeeTerm9;
  int? FeeAmountTerm9;
  String? FeePaymentDateTerm9;
  int? FeeReceiptNoTerm9;
  //
  String? FeeTerm10;
  int? FeeAmountTerm10;
  String? FeePaymentDateTerm10;
  int? FeeReceiptNoTerm10;
  //
  String? FeeTerm11;
  int? FeeAmountTerm11;
  String? FeePaymentDateTerm11;
  int? FeeReceiptNoTerm11;
  //
  String? FeeTerm12;
  int? FeeAmountTerm12;
  String? FeePaymentDateTerm12;
  int? FeeReceiptNoTerm12;

  PlaySchoolDataModel({
    required this.StudentName,
    required this.FatherNamePhone,
    this.MotherName,
    this.AdmissionDate,
    this.FatherPhone,
    this.MotherPhone,
    this.AdmissionNo,
    this.BloodGroup,
    this.FatherAadhar,
    this.MotherAadhar,
    this.Address,
    this.FeeTerm1,
    this.FeeAmountTerm1,
    this.FeePaymentDateTerm1,
    this.FeeReceiptNoTerm1,
    this.FeeTerm2,
    this.FeeAmountTerm2,
    this.FeePaymentDateTerm2,
    this.FeeReceiptNoTerm2,
    this.FeeTerm3,
    this.FeeAmountTerm3,
    this.FeePaymentDateTerm3,
    this.FeeReceiptNoTerm3,
    this.FeeTerm4,
    this.FeeAmountTerm4,
    this.FeePaymentDateTerm4,
    this.FeeReceiptNoTerm4,
    this.FeeTerm5,
    this.FeeAmountTerm5,
    this.FeePaymentDateTerm5,
    this.FeeReceiptNoTerm5,
    this.FeeTerm6,
    this.FeeAmountTerm6,
    this.FeePaymentDateTerm6,
    this.FeeReceiptNoTerm6,
    this.FeeTerm7,
    this.FeeAmountTerm7,
    this.FeePaymentDateTerm7,
    this.FeeReceiptNoTerm7,
    this.FeeTerm8,
    this.FeeAmountTerm8,
    this.FeePaymentDateTerm8,
    this.FeeReceiptNoTerm8,
    this.FeeTerm9,
    this.FeeAmountTerm9,
    this.FeePaymentDateTerm9,
    this.FeeReceiptNoTerm9,
    this.FeeTerm10,
    this.FeeAmountTerm10,
    this.FeePaymentDateTerm10,
    this.FeeReceiptNoTerm10,
    this.FeeTerm11,
    this.FeeAmountTerm11,
    this.FeePaymentDateTerm11,
    this.FeeReceiptNoTerm11,
    this.FeeTerm12,
    this.FeeAmountTerm12,
    this.FeePaymentDateTerm12,
    this.FeeReceiptNoTerm12,
  });

  PlaySchoolDataModel.fromJson(Map<String, dynamic> json) {
    StudentName = json['StudentName'];
    FatherNamePhone = json['FatherNamePhone'];
    MotherName = json['MotherName'];
    AdmissionDate = json['AdmissionDate'];
    FatherPhone = json['FatherPhone'];
    MotherPhone = json['MotherPhone'];
    AdmissionNo = json['AdmissionNo'];
    BloodGroup = json['BloodGroup'];
    FatherAadhar = json['FatherAadhar'];
    MotherAadhar = json['MotherAadhar'];
    Address = json['Address'];
    FeeTerm1 = json['FeeTerm1'];
    FeeAmountTerm1 = json['FeeAmountTerm1'];
    FeePaymentDateTerm1 = json['FeePaymentDateTerm1'];
    FeeReceiptNoTerm1 = json['FeeReceiptNoTerm1'];
    FeeTerm2 = json['FeeTerm2'];
    FeeAmountTerm2 = json['FeeAmountTerm2'];
    FeePaymentDateTerm2 = json['FeePaymentDateTerm2'];
    FeeReceiptNoTerm2 = json['FeeReceiptNoTerm2'];
    FeeTerm3 = json['FeeTerm3'];
    FeeAmountTerm3 = json['FeeAmountTerm3'];
    FeePaymentDateTerm3 = json['FeePaymentDateTerm3'];
    FeeReceiptNoTerm3 = json['FeeReceiptNoTerm3'];
    FeeTerm4 = json['FeeTerm4'];
    FeeAmountTerm4 = json['FeeAmountTerm4'];
    FeePaymentDateTerm4 = json['FeePaymentDateTerm4'];
    FeeReceiptNoTerm4 = json['FeeReceiptNoTerm4'];
    FeeTerm5 = json['FeeTerm5'];
    FeeAmountTerm5 = json['FeeAmountTerm5'];
    FeePaymentDateTerm5 = json['FeePaymentDateTerm5'];
    FeeReceiptNoTerm5 = json['FeeReceiptNoTerm5'];
    FeeTerm6 = json['FeeTerm6'];
    FeeAmountTerm6 = json['FeeAmountTerm6'];
    FeePaymentDateTerm6 = json['FeePaymentDateTerm6'];
    FeeReceiptNoTerm6 = json['FeeReceiptNoTerm6'];
    FeeTerm7 = json['FeeTerm7'];
    FeeAmountTerm7 = json['FeeAmountTerm7'];
    FeePaymentDateTerm7 = json['FeePaymentDateTerm7'];
    FeeReceiptNoTerm7 = json['FeeReceiptNoTerm7'];
    FeeTerm8 = json['FeeTerm8'];
    FeeAmountTerm8 = json['FeeAmountTerm8'];
    FeePaymentDateTerm8 = json['FeePaymentDateTerm8'];
    FeeReceiptNoTerm8 = json['FeeReceiptNoTerm8'];
    FeeTerm9 = json['FeeTerm9'];
    FeeAmountTerm9 = json['FeeAmountTerm9'];
    FeePaymentDateTerm9 = json['FeePaymentDateTerm9'];
    FeeReceiptNoTerm9 = json['FeeReceiptNoTerm9'];
    FeeTerm10 = json['FeeTerm10'];
    FeeAmountTerm10 = json['FeeAmountTerm10'];
    FeePaymentDateTerm10 = json['FeePaymentDateTerm10'];
    FeeReceiptNoTerm10 = json['FeeReceiptNoTerm10'];
    FeeTerm11 = json['FeeTerm11'];
    FeeAmountTerm11 = json['FeeAmountTerm11'];
    FeePaymentDateTerm11 = json['FeePaymentDateTerm11'];
    FeeReceiptNoTerm11 = json['FeeReceiptNoTerm11'];
    FeeTerm12 = json['FeeTerm12'];
    FeeAmountTerm12 = json['FeeAmountTerm12'];
    FeePaymentDateTerm12 = json['FeePaymentDateTerm12'];
    FeeReceiptNoTerm12 = json['FeeReceiptNoTerm12'];
  }

  Map<dynamic, dynamic> toJson() => {
        'StudentName': StudentName,
        'FatherNamePhone': FatherNamePhone,
        'MotherName': MotherName,
        'AdmissionDate': AdmissionDate,
        'FatherPhone': FatherPhone,
        'MotherPhone': MotherPhone,
        'AdmissionNo': AdmissionNo,
        'BloodGroup': BloodGroup,
        'FatherAadhar': FatherAadhar,
        'MotherAadhar': MotherAadhar,
        'Address': Address,
        'FeeTerm1': FeeTerm1,
        'FeeAmountTerm1': FeeAmountTerm1,
        'FeePaymentDateTerm1': FeePaymentDateTerm1,
        'FeeReceiptNoTerm1': FeeReceiptNoTerm1,
        'FeeTerm2': FeeTerm2,
        'FeeAmountTerm2': FeeAmountTerm2,
        'FeePaymentDateTerm2': FeePaymentDateTerm2,
        'FeeReceiptNoTerm2': FeeReceiptNoTerm2,
        'FeeTerm3': FeeTerm3,
        'FeeAmountTerm3': FeeAmountTerm3,
        'FeePaymentDateTerm3': FeePaymentDateTerm3,
        'FeeReceiptNoTerm3': FeeReceiptNoTerm3,
        'FeeTerm4': FeeTerm4,
        'FeeAmountTerm4': FeeAmountTerm4,
        'FeePaymentDateTerm4': FeePaymentDateTerm4,
        'FeeReceiptNoTerm4': FeeReceiptNoTerm4,
        'FeeTerm5': FeeTerm5,
        'FeeAmountTerm5': FeeAmountTerm5,
        'FeePaymentDateTerm5': FeePaymentDateTerm5,
        'FeeReceiptNoTerm5': FeeReceiptNoTerm5,
        'FeeTerm6': FeeTerm6,
        'FeeAmountTerm6': FeeAmountTerm6,
        'FeePaymentDateTerm6': FeePaymentDateTerm6,
        'FeeReceiptNoTerm6': FeeReceiptNoTerm6,
        'FeeTerm7': FeeTerm7,
        'FeeAmountTerm7': FeeAmountTerm7,
        'FeePaymentDateTerm7': FeePaymentDateTerm7,
        'FeeReceiptNoTerm7': FeeReceiptNoTerm7,
        'FeeTerm8': FeeTerm8,
        'FeeAmountTerm8': FeeAmountTerm8,
        'FeePaymentDateTerm8': FeePaymentDateTerm8,
        'FeeReceiptNoTerm8': FeeReceiptNoTerm8,
        'FeeTerm9': FeeTerm9,
        'FeeAmountTerm9': FeeAmountTerm9,
        'FeePaymentDateTerm9': FeePaymentDateTerm9,
        'FeeReceiptNoTerm9': FeeReceiptNoTerm9,
        'FeeTerm10': FeeTerm10,
        'FeeAmountTerm10': FeeAmountTerm10,
        'FeePaymentDateTerm10': FeePaymentDateTerm10,
        'FeeReceiptNoTerm10': FeeReceiptNoTerm10,
        'FeeTerm11': FeeTerm11,
        'FeeAmountTerm11': FeeAmountTerm11,
        'FeePaymentDateTerm11': FeePaymentDateTerm11,
        'FeeReceiptNoTerm11': FeeReceiptNoTerm11,
        'FeeTerm12': FeeTerm12,
        'FeeAmountTerm12': FeeAmountTerm12,
        'FeePaymentDateTerm12': FeePaymentDateTerm12,
        'FeeReceiptNoTerm12': FeeReceiptNoTerm12,
      };
}
