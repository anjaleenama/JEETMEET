import 'package:flutter/material.dart';
import 'package:jeetmeet/assigned_leave.dart';
import 'package:jeetmeet/leave_apply.dart';

class LeaveScreen extends StatefulWidget {
  @override
  _LeaveScreenState createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _appBarTitle = "Assigned Leave"; 

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging || _tabController.index >= 0) {
        setState(() {
          _appBarTitle = _tabController.index == 0 ? "Assigned Leave" : "Leave Apply";
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 221, 221),
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(_appBarTitle, style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.chat_bubble_outline, color: Colors.white), onPressed: () {}),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Text( "Assigned Leave",style: TextStyle(color: Colors.white),),
            Text( "Leave Apply",style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AssignedLeavePage(),
          LeaveApplicationScreen(),
        ],
      ),
    );
  }
}
