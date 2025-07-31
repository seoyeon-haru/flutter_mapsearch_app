// {
//       "title": "<b>HYBE</b>",
//       "link": "",
//       "category": "엔터테인먼트>연예기획사",
//       "description": "",
//       "telephone": "",
//       "address": "서울특별시 용산구 한강로3가 65-9",
//       "roadAddress": "서울특별시 용산구 한강대로 42",
//       "mapx": "1269641900",
//       "mapy": "375245525"
//     }

class Location {
  String title;
  String link;
  String category;
  String description;
  String telephone;
  String address;
  String roadAddress;
  String mapx;
  String mapy;

  Location({
    required this.title,
    required this.link,
    required this.category,
    required this.description,
    required this.telephone,
    required this.address,
    required this.roadAddress,
    required this.mapx,
    required this.mapy,
  });

  // 1. fromJson 네임드 생성자 만들기
  Location.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          link: map['link'],
          category: map['category'],
          description: map['description'],
          telephone: map['telephone'],
          address: map['address'],
          roadAddress: map['roadAddress'],
          mapx: map['mapx'],
          mapy: map['mapy'],
        );

  // 2. toJson 메서드 만들기
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'category': category,
      'description': description,
      'telephone': telephone,
      'address': address,
      'roadAddress': roadAddress,
      'mapx': mapx,
      'mapy': mapy,
    };
  }
}
