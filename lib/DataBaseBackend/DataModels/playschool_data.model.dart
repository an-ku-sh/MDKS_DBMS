class PlaySchoolDataModel {
  String? name;
  String? fnamephone;
  String? mname;
  String? admdt;
  int? fphone;
  int? mphone;
  String? admno;
  String? bldgrp;
  String? faadhar;
  String? maadhar;
  String? address;
  //
  String? feeT1;
  int? feeT1Amt;
  String? feeT1Dt;
  int? feeT1Rno;
  //
  String? feeT2;
  int? feeT2Amt;
  String? feeT2Dt;
  int? feeT2Rno;
  //
  String? feeT3;
  int? feeT3Amt;
  String? feeT3Dt;
  int? feeT3Rno;
  //
  String? feeT4;
  int? feeT4Amt;
  String? feeT4Dt;
  int? feeT4Rno;
  //
  String? feeT5;
  int? feeT5Amt;
  String? feeT5Dt;
  int? feeT5Rno;
  //
  String? feeT6;
  int? feeT6Amt;
  String? feeT6Dt;
  int? feeT6Rno;
  //
  String? feeT7;
  int? feeT7Amt;
  String? feeT7Dt;
  int? feeT7Rno;
  //
  String? feeT8;
  int? feeT8Amt;
  String? feeT8Dt;
  int? feeT8Rno;
  //
  String? feeT9;
  int? feeT9Amt;
  String? feeT9Dt;
  int? feeT9Rno;
  //
  String? feeT10;
  int? feeT10Amt;
  String? feeT10Dt;
  int? feeT10Rno;
  //
  String? feeT11;
  int? feeT11Amt;
  String? feeT11Dt;
  int? feeT11Rno;
  //
  String? feeT12;
  int? feeT12Amt;
  String? feeT12Dt;
  int? feeT12Rno;

  PlaySchoolDataModel({
    required this.name,
    required this.fnamephone,
    this.mname,
    this.admdt,
    this.fphone,
    this.mphone,
    this.admno,
    this.bldgrp,
    this.faadhar,
    this.maadhar,
    this.address,
    this.feeT1,
    this.feeT1Amt,
    this.feeT1Dt,
    this.feeT1Rno,
    this.feeT2,
    this.feeT2Amt,
    this.feeT2Dt,
    this.feeT2Rno,
    this.feeT3,
    this.feeT3Amt,
    this.feeT3Dt,
    this.feeT3Rno,
    this.feeT4,
    this.feeT4Amt,
    this.feeT4Dt,
    this.feeT4Rno,
    this.feeT5,
    this.feeT5Amt,
    this.feeT5Dt,
    this.feeT5Rno,
    this.feeT6,
    this.feeT6Amt,
    this.feeT6Dt,
    this.feeT6Rno,
    this.feeT7,
    this.feeT7Amt,
    this.feeT7Dt,
    this.feeT7Rno,
    this.feeT8,
    this.feeT8Amt,
    this.feeT8Dt,
    this.feeT8Rno,
    this.feeT9,
    this.feeT9Amt,
    this.feeT9Dt,
    this.feeT9Rno,
    this.feeT10,
    this.feeT10Amt,
    this.feeT10Dt,
    this.feeT10Rno,
    this.feeT11,
    this.feeT11Amt,
    this.feeT11Dt,
    this.feeT11Rno,
    this.feeT12,
    this.feeT12Amt,
    this.feeT12Dt,
    this.feeT12Rno,
  });

  PlaySchoolDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fnamephone = json['fnamephone'];
    mname = json['mname'];
    admdt = json['admdt'];
    fphone = json['fphone'];
    mphone = json['mphone'];
    admno = json['admno'];
    bldgrp = json['bldgrp'];
    faadhar = json['faadhar'];
    maadhar = json['maadhar'];
    address = json['address'];
    feeT1 = json['feeT1'];
    feeT1Amt = json['feeT1Amt'];
    feeT1Dt = json['feeT1Dt'];
    feeT1Rno = json['feeT1Rno'];
    feeT2 = json['feeT2'];
    feeT2Amt = json['feeT2Amt'];
    feeT2Dt = json['feeT2Dt'];
    feeT2Rno = json['feeT2Rno'];
    feeT3 = json['feeT3'];
    feeT3Amt = json['feeT3Amt'];
    feeT3Dt = json['feeT3Dt'];
    feeT3Rno = json['feeT3Rno'];
    feeT4 = json['feeT4'];
    feeT4Amt = json['feeT4Amt'];
    feeT4Dt = json['feeT4Dt'];
    feeT4Rno = json['feeT4Rno'];
    feeT5 = json['feeT5'];
    feeT5Amt = json['feeT5Amt'];
    feeT5Dt = json['feeT5Dt'];
    feeT5Rno = json['feeT5Rno'];
    feeT6 = json['feeT6'];
    feeT6Amt = json['feeT6Amt'];
    feeT6Dt = json['feeT6Dt'];
    feeT6Rno = json['feeT6Rno'];
    feeT7 = json['feeT7'];
    feeT7Amt = json['feeT7Amt'];
    feeT7Dt = json['feeT7Dt'];
    feeT7Rno = json['feeT7Rno'];
    feeT8 = json['feeT8'];
    feeT8Amt = json['feeT8Amt'];
    feeT8Dt = json['feeT8Dt'];
    feeT8Rno = json['feeT8Rno'];
    feeT9 = json['feeT9'];
    feeT9Amt = json['feeT9Amt'];
    feeT9Dt = json['feeT9Dt'];
    feeT9Rno = json['feeT9Rno'];
    feeT10 = json['feeT10'];
    feeT10Dt = json['feeT10Dt'];
    feeT10Amt = json['feeT10Amt'];
    feeT10Rno = json['feeT10Rno'];
    feeT11 = json['feeT11'];
    feeT11Amt = json['feeT11Amt'];
    feeT11Dt = json['feeT11Dt'];
    feeT11Rno = json['feeT11Rno'];
    feeT12 = json['feeT12'];
    feeT12Amt = json['feeT12Amt'];
    feeT12Dt = json['feeT12Dt'];
    feeT12Rno = json['feeT12Rno'];
  }

  Map<dynamic, dynamic> toJson() => {
        'name': name,
        'fnamephone': fnamephone,
        'mname': mname,
        'admdt': admdt,
        'fphone': fphone,
        'mphone': mphone,
        'admno': admno,
        'bldgrp': bldgrp,
        'faadhar': faadhar,
        'maadhar': maadhar,
        'address': address,
        'feeT1': feeT1,
        'feeT1Amt': feeT1Amt,
        'feeT1Dt': feeT1Dt,
        'feeT1Rno': feeT1Rno,
        'feeT2': feeT2,
        'feeT2Amt': feeT2Amt,
        'feeT2Dt': feeT2Dt,
        'feeT2Rno': feeT2Rno,
        'feeT3': feeT3,
        'feeT3Amt': feeT3Amt,
        'feeT3Dt': feeT3Dt,
        'feeT3Rno': feeT3Rno,
        'feeT4': feeT4,
        'feeT4Amt': feeT4Amt,
        'feeT4Dt': feeT4Dt,
        'feeT4Rno': feeT4Rno,
        'feeT5': feeT5,
        'feeT5Amt': feeT5Amt,
        'feeT5Dt': feeT5Dt,
        'feeT5Rno': feeT5Rno,
        'feeT6': feeT6,
        'feeT6Amt': feeT6Amt,
        'feeT6Dt': feeT6Dt,
        'feeT6Rno': feeT6Rno,
        'feeT7': feeT7,
        'feeT7Amt': feeT7Amt,
        'feeT7Dt': feeT7Dt,
        'feeT7Rno': feeT7Rno,
        'feeT8': feeT8,
        'feeT8Amt': feeT8Amt,
        'feeT8Dt': feeT8Dt,
        'feeT8Rno': feeT8Rno,
        'feeT9': feeT9,
        'feeT9Amt': feeT9Amt,
        'feeT9Dt': feeT9Dt,
        'feeT9Rno': feeT9Rno,
        'feeT10': feeT10,
        'feeT10Amt': feeT10Amt,
        'feeT10Dt': feeT10Dt,
        'feeT10Rno': feeT10Rno,
        'feeT11': feeT11,
        'feeT11Amt': feeT11Amt,
        'feeT11Dt': feeT11Dt,
        'feeT11Rno': feeT11Rno,
        'feeT12': feeT12,
        'feeT12Amt': feeT12Amt,
        'feeT12Dt': feeT12Dt,
        'feeT12Rno': feeT12Rno
      };
}
