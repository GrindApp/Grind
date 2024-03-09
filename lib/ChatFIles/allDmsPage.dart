import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum Actions { delete, block }

class AllDmsPage extends StatefulWidget {
  // const AllDmsPage({super.key});

  @override
  State<AllDmsPage> createState() => _AllDmsPageState();
}

class User {
  final String name;
  final String email;
  final String image;

  User({required this.email, required this.name, required this.image});
}

class _AllDmsPageState extends State<AllDmsPage> {
  final List<User> users = [
    User(
      name: 'John Doe',
      email: 'john@example.com',
      image: 'assets/images/user1.jpg', // Replace with actual image path
    ),
    User(
      name: 'Jane Smith',
      email: 'jane@example.com',
      image: 'assets/images/user2.jpg', // Replace with actual image path
    ),
    User(
      name: 'Mohsin',
      email: 'jane@example.com',
      image: 'assets/images/user2.jpg', // Replace with actual image path
    ),
    User(
      name: 'Utkarsh',
      email: 'jane@example.com',
      image: 'assets/images/user2.jpg', // Replace with actual image path
    ),
  ];

  // List<users> users = allUsers;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Slidable(
                  startActionPane: ActionPane(
                    motion: StretchMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.redAccent,
                        icon: Icons.delete,
                        label: "Delete",
                        onPressed: (context) =>
                            _onDismissed(index, Actions.delete),
                      ),
                      SlidableAction(
                        backgroundColor: Colors.white,
                        icon: Icons.block,
                        label: "Block",
                        onPressed: (context) =>
                            _onDismissed(index, Actions.block),
                      )
                    ],
                  ),
                  child: buildUserListTile(user));
            }),
      ),
    );
  }

  void _onDismissed(int index, Actions action) {
    final user = users[index];
    setState(() {
      users.removeAt(index);
    });
  }

  Widget buildUserListTile(User user) => ListTile(
      contentPadding: EdgeInsets.all(16),
      title: Text(
        user.name,
        style: TextStyle(color: Colors.white),
      ),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(user.image),
      ));
}
//
