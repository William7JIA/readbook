class Book {
  String sId;
  String namabuku;
  int halaman;
  String penulis;
  int harga;
  String ebook;
  String cover;
  int iV;

  Book(
      {this.sId,
      this.namabuku,
      this.halaman,
      this.penulis,
      this.harga,
      this.ebook,
      this.cover,
      this.iV});

  Book.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    namabuku = json['namabuku'];
    halaman = json['halaman'];
    penulis = json['penulis'];
    harga = json['harga'];
    ebook = json['ebook'];
    cover = json['cover'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['namabuku'] = this.namabuku;
    data['halaman'] = this.halaman;
    data['penulis'] = this.penulis;
    data['harga'] = this.harga;
    data['ebook'] = this.ebook;
    data['cover'] = this.cover;
    data['__v'] = this.iV;
    return data;
  }
}
