import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterinterviewdemo/Model/UserData.dart';
import 'package:flutterinterviewdemo/Network/http.dart';
import 'package:flutterinterviewdemo/utils.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();

    getUserData();
  }

  List<UserData> userData = [];

  getUserData() async {
    List<UserData> localUsers = await PrefUtils().getUsersData();
    print(localUsers.toString());
    if (localUsers == [] || localUsers == null) {
      List<UserData> u = await fetchUsers();

      setState(() {
        userData = u;
      });
    } else {
      setState(() {
        userData = localUsers;
      });
    }
  }

  refereshData() async {
    setState(() {
      userData = null;
    });
    List<UserData> u = await fetchUsers();
    setState(() {
      userData = u;
    });
  }

  void removeUser(int index) {
    setState(() {
      userData = List.from(userData)..removeAt(index);
    });
    PrefUtils().saveUsers(userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Dashboard'),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                refereshData();
              },
              child: Icon(
                Icons.refresh,
              ),
            ),
          )
        ],
      ),
      body: userData == null
          ? Center(child: CupertinoActivityIndicator())
          : ListView.separated(
              shrinkWrap: false,
              itemCount: userData.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 2,
                color: Colors.black,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
                        child: Center(
                          child: Image.network(userData[index].picture),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userData[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              userData[index].email,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              userData[index].phone,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          removeUser(index);
                        },
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
