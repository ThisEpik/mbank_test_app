class ManufacturerModel {
  final String country;
  final String? mfrCommonName;
  final int mfrID;
  final String mfrName;
  final List<dynamic> mehicleTypes; // dynamic потому что не нужно по тз

  ManufacturerModel({
    required this.country,
    required this.mfrCommonName,
    required this.mfrID,
    required this.mfrName,
    required this.mehicleTypes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Country': country,
      'Mfr_CommonName': mfrCommonName,
      'Mfr_ID': mfrID,
      'Mfr_Name': mfrName,
      'MehicleTypes': mehicleTypes,
    };
  }

  factory ManufacturerModel.fromMap(Map<String, dynamic> map) {
    return ManufacturerModel(
      country: map['Country'] as String,
      mfrCommonName: map['Mfr_CommonName'] as String?,
      mfrID: map['Mfr_ID'] as int,
      mfrName: map['Mfr_Name'] as String,
      mehicleTypes: List<dynamic>.from((map['VehicleTypes'] as List<dynamic>)),
    );
  }
}
