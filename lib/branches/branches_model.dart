class BranchesModel {
  bool? status;
  String? message;
  NearestBranch? nearestBranch;
  List<NearestBranch>? nearestBranches;

  BranchesModel(
      {this.status, this.message, this.nearestBranch, this.nearestBranches});

  BranchesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    nearestBranch = json['nearestBranch'] != null
        ? new NearestBranch.fromJson(json['nearestBranch'])
        : null;
    if (json['nearestBranches'] != null) {
      nearestBranches = <NearestBranch>[];
      json['nearestBranches'].forEach((v) {
        nearestBranches!.add(new NearestBranch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.nearestBranch != null) {
      data['nearestBranch'] = this.nearestBranch!.toJson();
    }
    if (this.nearestBranches != null) {
      data['nearestBranches'] =
          this.nearestBranches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearestBranch {
  int? id;
  double? distance;
  double? latitude;
  double? longitude;
  String? name;
  String? title;

  NearestBranch(
      {this.id,
        this.distance,
        this.latitude,
        this.longitude,
        this.name,
        this.title});

  NearestBranch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    distance = json['distance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['distance'] = this.distance;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['name'] = this.name;
    data['title'] = this.title;
    return data;
  }
}
