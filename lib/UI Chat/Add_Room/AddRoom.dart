import 'package:chat_app/Base/Base.dart';
import 'package:chat_app/UI%20Chat/Add_Room/AddRoomViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRoom extends StatefulWidget {
  static const String routeName = 'addRoom';

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends BaseState<AddRoom, AddRoomViewModel>
    implements AddRoomNavigator {
  List<RoomCategory> allCategory = RoomCategory.getCategory();
  late RoomCategory selected;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => viewModel,
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.fill)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 120,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'Chat App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            body: Card(
              margin: EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 50),
              elevation: 100,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 18, right: 18, left: 18, bottom: 50),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Create New Room',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Image.asset('images/group-1824146_1280.png'),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Enter Room Name'),
                      ),
                      DropdownButton<RoomCategory>(style: TextStyle(color: Colors.black),
                          items: allCategory
                              .map((category) => DropdownMenuItem<RoomCategory>(
                                  value: selected,
                                  child: Text(category.name ?? '')))
                              .toList(),
                          onChanged: (items) {
                            if (items == null) return;
                            setState(() {
                              selected = items;
                            });
                          }),
                      TextFormField(
                        maxLines: 4,
                        minLines: 3,
                        decoration: InputDecoration(
                            labelText: 'Enter Room Descreption'),
                      ),
                      Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0XFF3598DB), // background
                              onPrimary: Colors.white,
                              padding: EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(18)) // foreground
                              ),
                          onPressed: () {},
                          child: Text('Create'))
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  @override
  AddRoomViewModel initViewModel() {
    // TODO: implement initViewModel
    return AddRoomViewModel();
  }

  @override
  void initState() {
    // TODO: implement initState
    selected = allCategory[0];
  }
}

class RoomCategory {
  String? id;
  String? name;
  String? imageName;
  RoomCategory({this.id, this.name, this.imageName});
  static List<RoomCategory> getCategory() {
    return [
      RoomCategory(id: 'music', name: 'Music', imageName: "music.png"),
      RoomCategory(id: 'music', name: 'Music', imageName: "music.png"),
      RoomCategory(id: 'music', name: 'Music', imageName: "music.png"),
    ];
  }
}
