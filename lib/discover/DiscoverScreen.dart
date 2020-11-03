import 'package:demo/navigatorTask/NavigatorTaskScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/discover/CompanyItem.dart';
import 'package:demo/provider/company_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//暗号：江湖再见
class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  CompanyListProvider provider;

  @override
  void initState() {
    super.initState();

    setState(() {
      provider = Provider.of<CompanyListProvider>(context, listen: false);
    });

    //初始化数据请求
    provider.refreshData();
  }

  //下拉刷新
  void _onRefresh() async {
    var isSuccess = await provider.refreshData();

    if (isSuccess) {
      _refreshController.refreshCompleted();
    } else {
      _refreshController.refreshFailed();
    }
  }

  //上拉加载
  void _onLoading() async {
    var isSuccess = await provider.loadMoreData();

    if (isSuccess) {
      _refreshController.loadComplete();
    } else {
      _refreshController.loadFailed();
    }
  }

  Widget _buildContent() {
    return Consumer<CompanyListProvider>(
      builder: (context, provider, _) {
        return IndexedStack(
          index: provider.showValue,
          children: [
            Center(child: CircularProgressIndicator()),
            SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              header: ClassicHeader(
                refreshingText: "正在加载中...",
                releaseText: "松开刷新",
                idleText: "下拉刷新",
                failedText: "刷新失败",
                completeText: "刷新成功",
              ),
              footer: ClassicFooter(
                loadingText: "加载中...",
                idleText: "上拉加载更多",
                noDataText: "没有更多数据",
                failedText: "加载失败",
              ),
              child: ListView.builder(
                itemCount: provider.companyList.length,
                itemBuilder: (context, index) {
                  var model = provider.companyList[index];
                  return GestureDetector(
                    child: CompanyItem(model),
                    onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NavigatorTaskScreen(model),
                        ),
                      )
                    },
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("发现"),
        ),
        body: _buildContent());
  }
}
