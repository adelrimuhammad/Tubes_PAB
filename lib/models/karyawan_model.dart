class KaryawanModel {
  int? id;
  String? name;
  String? jabatan;
  String? nik;
  String? tgl_lahir;
  String? no_tlp;
  String? status;
  int? tahun_bergabung;

  KaryawanModel({
    this.id,
    this.name,
    this.jabatan,
    this.nik,
    this.tgl_lahir,
    this.no_tlp,
    this.status,
    this.tahun_bergabung,
  });

  KaryawanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    jabatan = json['jabatan'];
    nik = json['nik'];
    tgl_lahir = json['tgl_lahir'];
    no_tlp = json['no_tlp'];
    status = json['status'];
    tahun_bergabung = json['tahun_bergabung'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'jabatan': jabatan,
      'nik': nik,
      'tgl_lahir': tgl_lahir,
      'no_tlp': no_tlp,
      'status': status,
      'tahun_bergabung': tahun_bergabung,
    };
  }
}
