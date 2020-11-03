import 'package:demo/discover/Company.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompanyListProvider with ChangeNotifier {
  List<Company> _companyList = new List();
  int _currentPage = 1;
  int _showValue = 0;

  //获取list数据
  List<Company> get companyList => _companyList;

  //获取页数
  int get currentPage => _currentPage;

  //获取显示状态
  int get showValue => _showValue;

  set companyList(List<Company> companyList) {
    _companyList = companyList;
    notifyListeners();
  }

  String getUrl(int pageIndex) {
    return "http://m.app.haosou.com/index/getData?type=1&page=$pageIndex";
  }

  refreshData() async {
    var url = getUrl(1);

    try {
      var response = await http.get(url);
      var data = Company.mapData(response.body);
      _companyList = data;
      _currentPage = 1;
      _showValue = 1;

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  loadMoreData() async {
    try {
      var url = getUrl(_currentPage + 1);
      var response = await http.get(url);
      var data = Company.mapData(response.body);
      _companyList.addAll(data);
      ++_currentPage;

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
