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
  String? feeT1Dt;
  int? feeT1Rno;
  //
  String? feeT2;
  String? feeT2Dt;
  int? feeT2Rno;
  //
  String? feeT3;
  String? feeT3Dt;
  int? feeT3Rno;
  //
  String? feeT4;
  String? feeT4Dt;
  int? feeT4Rno;
  //
  String? feeT5;
  String? feeT5Dt;
  int? feeT5Rno;
  //
  String? feeT6;
  String? feeT6Dt;
  int? feeT6Rno;
  //
  String? feeT7;
  String? feeT7Dt;
  int? feeT7Rno;
  //
  String? feeT8;
  String? feeT8Dt;
  int? feeT8Rno;
  //
  String? feeT9;
  String? feeT9Dt;
  int? feeT9Rno;
  //
  String? feeT10;
  String? feeT10Dt;
  int? feeT10Rno;
  //
  String? feeT11;
  String? feeT11Dt;
  int? feeT11Rno;
  //
  String? feeT12;
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
    this.feeT1Dt,
    this.feeT1Rno,
    this.feeT2,
    this.feeT2Dt,
    this.feeT2Rno,
    this.feeT3,
    this.feeT3Dt,
    this.feeT3Rno,
    this.feeT4,
    this.feeT4Dt,
    this.feeT4Rno,
    this.feeT5,
    this.feeT5Dt,
    this.feeT5Rno,
    this.feeT6,
    this.feeT6Dt,
    this.feeT6Rno,
    this.feeT7,
    this.feeT7Dt,
    this.feeT7Rno,
    this.feeT8,
    this.feeT8Dt,
    this.feeT8Rno,
    this.feeT9,
    this.feeT9Dt,
    this.feeT9Rno,
    this.feeT10,
    this.feeT10Dt,
    this.feeT10Rno,
    this.feeT11,
    this.feeT11Dt,
    this.feeT11Rno,
    this.feeT12,
    this.feeT12Dt,
    this.feeT12Rno,
  });

  PlaySchoolDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fnamephone = json['fname_phone'];
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
    feeT1Dt = json['feeT1Dt'];
    feeT1Rno = json['feeT1Rno'];
    feeT2 = json['feeT2'];
    feeT2Dt = json['feeT2Dt'];
    feeT2Rno = json['feeT2Rno'];
    feeT3 = json['feeT3'];
    feeT3Dt = json['feeT3Dt'];
    feeT3Rno = json['feeT3Rno'];
    feeT4 = json['feeT4'];
    feeT4Dt = json['feeT4Dt'];
    feeT4Rno = json['feeT4Rno'];
    feeT5 = json['feeT5'];
    feeT5Dt = json['feeT5Dt'];
    feeT5Rno = json['feeT5Rno'];
    feeT6 = json['feeT6'];
    feeT6Dt = json['feeT6Dt'];
    feeT6Rno = json['feeT6Rno'];
    feeT7 = json['feeT7'];
    feeT7Dt = json['feeT7Dt'];
    feeT7Rno = json['feeT7Rno'];
    feeT8 = json['feeT8'];
    feeT8Dt = json['feeT8Dt'];
    feeT8Rno = json['feeT8Rno'];
    feeT9 = json['feeT9'];
    feeT9Dt = json['feeT9Dt'];
    feeT9Rno = json['feeT9Rno'];
    feeT10 = json['feeT10'];
    feeT10Dt = json['feeT10Dt'];
    feeT10Rno = json['feeT10Rno'];
    feeT11 = json['feeT11'];
    feeT11Dt = json['feeT11Dt'];
    feeT11Rno = json['feeT11Rno'];
    feeT12 = json['feeT12'];
    feeT12Dt = json['feeT12Dt'];
    feeT12Rno = json['feeT12Rno'];
  }

  PlaySchoolDataModel.toJson({
    mname,
    admdt,
    fphone,
    mphone,
    admno,
    bldgrp,
    faadhar,
    maadhar,
    address,
    feeT1,
    feeT1Dt,
    feeT1Rno,
    feeT2,
    feeT2Dt,
    feeT2Rno,
    feeT3,
    feeT3Dt,
    feeT3Rno,
    feeT4,
    feeT4Dt,
    feeT4Rno,
    feeT5,
    feeT5Dt,
    feeT5Rno,
    feeT6,
    feeT6Dt,
    feeT6Rno,
    feeT7,
    feeT7Dt,
    feeT7Rno,
    feeT8,
    feeT8Dt,
    feeT8Rno,
    feeT9,
    feeT9Dt,
    feeT9Rno,
    feeT10,
    feeT10Dt,
    feeT10Rno,
    feeT11,
    feeT11Dt,
    feeT11Rno,
    feeT12,
    feeT12Dt,
    feeT12Rno,
  }) {}
}
