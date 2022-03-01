class Homepage {
  String? id;
  bool? status;
  String? target;
  String? realita;
  String? kategori;
  String? subaktivitas;
  String? waktu;
  String? tanggal;

  Homepage(
      {this.id,
      this.status,
      this.target,
      this.realita,
      this.kategori,
      this.subaktivitas,
      this.waktu,
      this.tanggal});

  Homepage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['staus'];
    target = json['target'];
    realita = json['realita'];
    kategori = json['kategori'];
    subaktivitas = json['subaktivitas'];
    waktu = json['waktu'];
    tanggal = json['tanggal'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['staus'] = status;
    data['target'] = target;
    data['realita'] = realita;
    data['kategori'] = kategori;
    data['subaktivitas'] = subaktivitas;
    data['waktu'] = waktu;
    data['tanggal'] = tanggal;
    return data;
  }
}
