class catmodal {
  List<Meals>? meals;

  catmodal({this.meals});

  catmodal.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(new Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  String? strCategory;

  Meals({this.strCategory});

  Meals.fromJson(Map<String, dynamic> json) {
    strCategory = json['strCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strCategory'] = this.strCategory;
    return data;
  }
}
