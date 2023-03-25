class DashboardListModel {
  int? totalCount;
  List<Requests>? requests;

  DashboardListModel({this.totalCount, this.requests});

  DashboardListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    if (json['requests'] != null) {
      requests = <Requests>[];
      json['requests'].forEach((v) {
        requests!.add(Requests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    if (requests != null) {
      data['requests'] = requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Requests {
  dynamic bessId;
  dynamic iB;
  dynamic iR;
  dynamic iY;
  dynamic kva;
  dynamic kvah;
  dynamic vR;
  dynamic createdAt;


  Requests(
      {this.bessId,
      this.iB,
      this.iR,
      this.iY,
      this.kva,
      this.kvah,
      this.vR,
      this.createdAt});

  Requests.fromJson(Map<String, dynamic> json) {
    bessId = json['bess_id'];
    iB = json['i_b'];
    iR = json['i_r'];
    iY = json['i_y'];
    kva = json['kva'];
    kvah = json['kvah'];
    vR = json['v_r'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bess_id'] = bessId;
    data['i_b'] = iB;
    data['i_r'] = iR;
    data['i_y'] = iY;
    data['kva'] = kva;
    data['kvah'] = kvah;
    data['v_r'] = vR;
    data['created_at'] = createdAt;
    return data;
  }
}
