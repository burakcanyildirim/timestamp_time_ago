# timestamp_time_ago



## Example

```dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timestamp_time_ago/timestamp_time_ago.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('hello').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (1 / 1), crossAxisCount: 2),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return Container(
                  margin: EdgeInsets.all(5),                   
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓                                                
                        TimeStampTimeAgo(
                          timeStampData:
                              snapshot.data.docs[index].data()['activitytime'],
                        ),
                        //↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.cyan,
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

```




![]()

![]() ![]
