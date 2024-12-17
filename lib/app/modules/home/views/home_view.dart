import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/modules/dosen/views/dosen_add_view.dart';
import 'package:myapp/app/modules/dosen/views/dosen_view.dart';
import 'package:myapp/app/modules/mahasiswa/views/mahasiswa_add_view.dart';
import 'package:myapp/app/modules/mahasiswa/views/mahasiswa_view.dart';
import 'package:myapp/app/modules/pegawai/views/pegawai_add_view.dart';
import 'package:myapp/app/modules/pegawai/views/pegawai_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return DashboardAdmin();
  }
}

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  final cAuth = Get.find<AuthController>();
  int _index = 0;
  List<Map> _fragment = [
    {
      'title': 'Dashboard',
      'view': MahasiswaView(),
      'add': () => MahasiswaAddView(),
    },
    {
      'title': 'Data Mahasiswa',
      'view': MahasiswaView(),
      'add': () => MahasiswaAddView(),
    },
    {
      'title': 'Data Dosen',
      'view': DosenView(),
      'add': () => DosenAddView(),
    },
    {
      'title': 'Data Pegawai',
      'view': PegawaiView(),
      'add': () => PegawaiAddView(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Colors.purple, // Changed to purple
        titleSpacing: 0,
        title: Text(_fragment[_index]['title']),
        actions: [
          IconButton(
            onPressed: () => Get.to(_fragment[_index]['add']),
            icon: Icon(Icons.add_circle_outline),
          )
        ],
      ),
      body: _fragment[_index]['view'],
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple, // Changed to purple
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.white, // White color for icon
                ),
                Text(
                  "Tegar Sya'bani Hamid",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white), // White text color
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Admin',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white, // White text color
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 0);
              Get.back();
            },
            leading: Icon(Icons.dashboard, color: Colors.purple), // Purple icon color
            title: Text('Dashboard', style: TextStyle(color: Colors.purple)), // Purple text color
            trailing: Icon(Icons.navigate_next, color: Colors.purple), // Purple icon color
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 1);
              Get.back();
            },
            leading: Icon(Icons.people, color: Colors.purple), // Purple icon color
            title: Text('Data Mahasiswa', style: TextStyle(color: Colors.purple)), // Purple text color
            trailing: Icon(Icons.navigate_next, color: Colors.purple), // Purple icon color
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 2);
              Get.back();
            },
            leading: Icon(Icons.people, color: Colors.purple), // Purple icon color
            title: Text('Data Dosen', style: TextStyle(color: Colors.purple)), // Purple text color
            trailing: Icon(Icons.navigate_next, color: Colors.purple), // Purple icon color
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 3);
              Get.back();
            },
            leading: Icon(Icons.people, color: Colors.purple), // Purple icon color
            title: Text('Data Pegawai', style: TextStyle(color: Colors.purple)), // Purple text color
            trailing: Icon(Icons.navigate_next, color: Colors.purple), // Purple icon color
          ),
          ListTile(
            onTap: () {
              Get.back();
              cAuth.logout();
            },
            leading: Icon(Icons.logout, color: Colors.purple), // Purple icon color
            title: Text('Logout', style: TextStyle(color: Colors.purple)), // Purple text color
            trailing: Icon(Icons.navigate_next, color: Colors.purple), // Purple icon color
          ),
        ],
      ),
    );
  }
}
