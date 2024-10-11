class SliderResponse {
  List<String>? slides;
  String? name;
  String? description;
  String? facebook;
  String? telegram;
  String? tiktok;
  String? youtube;
  String? email;
  List<String>? phoneNumbers;

  SliderResponse({
    this.slides,
    this.name,
    this.description,
    this.facebook,
    this.telegram,
    this.tiktok,
    this.youtube,
    this.email,
    this.phoneNumbers,
  });

  SliderResponse.fromJson(Map<String, dynamic> json) {
    slides = json['slides'].cast<String>();
    name = json['name'];
    description = json['description'];
    facebook = json['facebook'];
    telegram = json['telegram'];
    tiktok = json['tiktok'];
    youtube = json['youtube'];
    email = json['email'];
    phoneNumbers = json['phoneNumbers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slides'] = slides;
    data['name'] = name;
    data['description'] = description;
    data['facebook'] = facebook;
    data['telegram'] = telegram;
    data['tiktok'] = tiktok;
    data['youtube'] = youtube;
    data['email'] = email;
    data['phoneNumbers'] = phoneNumbers;
    return data;
  }
}
