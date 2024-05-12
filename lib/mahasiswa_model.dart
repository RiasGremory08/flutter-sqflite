class MahasiswaModel {
  final int? id;
  final String nama;
  final String jenjang;
  final String prodi;

  MahasiswaModel(
      {this.id,
     
      required this.nama,
      required this.jenjang,
      required this.prodi});

  factory MahasiswaModel.fromMap(Map<String, dynamic> json) => MahasiswaModel(
      id: json['id'],
     
      nama: json['nama'],
      jenjang: json['jenjang'],
      prodi: json['prodi']);



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      
      'nama': nama,
      'jenjang': jenjang,
      'prodi': prodi
    };
  }

    factory MahasiswaModel.fromJson(Map<String, dynamic> json){
return MahasiswaModel(
      id: json['id'],
    
      nama: json['nama'],
      jenjang: json['jenjang'],
      prodi: json['prodi']);
    } 


    
}
