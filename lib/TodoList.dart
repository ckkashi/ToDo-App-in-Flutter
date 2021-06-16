import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var getVal = "";
  List<String> lst = ['1', '2', '3'];
  Widget alertD() {
    return AlertDialog(
      title: Text(
        'Add',
      ),
      content: TextField(
        onChanged: (value) {
          getVal = value;
        },
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                lst.add(getVal);
              });
            },
            child: Text('ADD'))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo App',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'cursive'),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return sample(index);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return alertD();
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget sample(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(5),
        child: ListTile(
          title: Text(
            "${lst[index]}",
            style: TextStyle(color: Colors.black),
          ),
          trailing: Container(
            width: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Update"),
                              content: TextField(
                                onChanged: (value) {
                                  getVal = value;
                                },
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context).pop();
                                        lst.replaceRange(
                                            index, index + 1, {getVal});
                                      });
                                    },
                                    child: Text('UPDATE'))
                              ],
                            );
                          });
                    },
                    child: Icon(Icons.update)),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          lst.removeAt(index);
                        });
                      },
                      child: Icon(Icons.remove_circle_outline)),
                ),
              ],
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.amber,
        ),
      ),
    );
  }
}
