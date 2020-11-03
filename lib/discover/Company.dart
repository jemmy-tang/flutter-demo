import 'dart:convert';

class Company {
  final String location;
  final String logo;
  final String employee;
  final String type;
  final String round;
  final String hotPost;
  final String url;

  Company(
      {this.location,
      this.logo,
      this.employee,
      this.type,
      this.round,
      this.hotPost,
      this.url});

  static List<Company> mapData(json) {
    List<Company> listModel = new List<Company>();
    List list = jsonDecode(json)['list'];
    list.forEach((element) {
      var model = new Company(
          location: element['download_times_fixed'],
          logo: element['logo_url'],
          employee: element['market_id'],
          type: element['type'],
          round: element['baike_name'],
          hotPost: element['download_times_fixed'],
          url: element["url"]);
      listModel.add(model);
    });

    return listModel;
  }
}
