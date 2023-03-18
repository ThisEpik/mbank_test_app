class VehicleBrandModel {
  final int makeID;
  final String makeName;
  final String mfrName;

  VehicleBrandModel({
    required this.makeID,
    required this.makeName,
    required this.mfrName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Make_ID': makeID,
      'Make_Name': makeName,
      'Mfr_Name': mfrName,
    };
  }

  factory VehicleBrandModel.fromMap(Map<String, dynamic> map) {
    return VehicleBrandModel(
      makeID: map['Make_ID'] as int,
      makeName: map['Make_Name'] as String,
      mfrName: map['Mfr_Name'] as String,
    );
  }
}
