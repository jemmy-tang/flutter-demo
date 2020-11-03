import 'package:flutter/material.dart';
import 'package:demo/discover/Company.dart';

//暗号：不用背，学规律
class CompanyItem extends StatelessWidget {
  final Company model;
  CompanyItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        child: Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          image: DecorationImage(
                              image: NetworkImage(model.logo),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        width: 120,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          model.location,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        //撑满剩余宽度
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "| " + model.type,
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              "| " + model.round,
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              "| " + model.employee,
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "热招：" + model.hotPost,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
