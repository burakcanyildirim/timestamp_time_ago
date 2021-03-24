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



![](https://raw.githubusercontent.com/burakcanyildirim/timestamp_time_ago/master/firebase-timestamp.JPG)




## Use this Widget
```dart
                     TimeStampTimeAgo(
                          timeStampData:
                              snapshot.data.docs[index].data()['activitytime'],
                        ),
```

## Output
![](https://github.com/burakcanyildirim/timestamp_time_ago/blob/master/package-screenshot.png?raw=true)



## Others

```dart
                    TimeStampTimeAgo(
                          timeStampData: snapshot.data.docs[index].data()['activitytime'],
                          yearAgo: 'yıl önce',
                          monthAgo: 'ay önce',
                          dayAgo: 'gün önce',
                          hourAgo: 'saat önce',
                          minuteAgo: 'dakika önce',
                          minuteLater: 'dakika sonra',
                          hourLater: 'saat sonra',
                          dayLater: 'gün sonra',
                          monthLater: 'ay sonra',
                          yearLater: 'yıl sonra',
                          textFontSize: 20,
                          textColor: Colors.purple,
                          textFontWeight: FontWeight.bold,
                          fontFamily: 'Klavika',
                        ),
```

## Output
![](https://github.com/burakcanyildirim/timestamp_time_ago/blob/master/screenshot-2.png?raw=true)