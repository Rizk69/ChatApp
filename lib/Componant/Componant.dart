import 'package:flutter/material.dart';

void showLoading(BuildContext context, String text) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white70,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
         scrollable: true,
          content: Row(
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,shadows: [
                  Shadow(
                      blurRadius: 1,
                      offset: Offset.fromDirection(1)
                  )
                ]),
              ),
              SizedBox(width: 15,),
              CircularProgressIndicator(strokeWidth: 4,),


            ],
          ),
        );
      });
}

void hidden(BuildContext context) {
  Navigator.pop(context);
}

void showMassge(
    BuildContext context, String text, String actionname, VoidCallback action,
    {String? negactionname, VoidCallback? negaction}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white70,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          content: Text(
            text,
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400,shadows: [
              Shadow(
                  blurRadius: 0,

                  offset: Offset.fromDirection(1)
              )
            ]),
          ),
          actions: [
            TextButton(onPressed: action, child: Text(actionname,style: TextStyle(fontSize: 25,color: Colors.black),)),
            if (negactionname != null)
              TextButton(onPressed: negaction, child: Text(negactionname))
          ],
        );
      });
}

AlertDialog showUpdateTasks() {
  BuildContext context;
  return AlertDialog(
    content: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text('Edit Text'),
            TextField(
              decoration: InputDecoration(hintText: 'This is Title'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'This is Detils'),
            ),
            Text('Select Time',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            InkWell(
              onTap: () {
                showDateTime();
              },
              child: Text(
                '5 ',
                style: TextStyle(
                    color: Color(0XFF707070),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )),
  );
}

void showDateTime() {
  var context;
  showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)));
}
