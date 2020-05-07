import 'package:flutter/material.dart';
import 'package:highvibe/app/wallet/resources/app_colors.dart';
import 'package:highvibe/app/wallet/pages/widgets/containers/transaction_container.dart';

class TransactionsPage extends StatefulWidget {

  @override
  TransactionsPageState createState() => TransactionsPageState();
}

class TransactionsPageState extends State<TransactionsPage> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();
    
    tabController = TabController(length: 3, vsync: this);
  }

  void onBack() {
    Navigator.pop(context);
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundDarkBlue,
      title: Text('Transactions'),
    );
  }

  Widget buildTabs() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      height: 40,
      child: TabBar(
        controller: tabController,
        unselectedLabelColor: AppColors.textGrey,
        indicator: BoxDecoration(
          border: Border.all(color: AppColors.textBlue),
          borderRadius: BorderRadius.circular(50)
        ),
        tabs: [
          Tab(
            text: 'All'
          ),
          Tab(
            text: 'Received'
          ),
          Tab(
            text: 'Sent'
          ),
        ]
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      padding: EdgeInsets.only(top: 3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.backgroundLightBlue,
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.white
        ),
        decoration: InputDecoration(
          isDense: false,
          prefixIcon: Padding(
            padding: EdgeInsets.only(),
            child: Icon(Icons.search, color: AppColors.textGrey),
          ),
          focusedBorder: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: AppColors.textGrey
          )
        ),
      ),
    );
  }

  Widget buildSplitter(String text) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: AppColors.textGrey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(text,
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 14
              ),
            )
          ),
          Expanded(
            child: Divider(
              color: AppColors.textGrey,
            ),
          )
        ],
      )
    );
  }

  Widget buildTransactions() {
    return Column(
      children: <Widget>[
        buildSplitter('Today'),
        TransactionContainer(
          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        ),
        TransactionContainer(
          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        ),
        TransactionContainer(
          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        ),
        TransactionContainer(
          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        ),
        TransactionContainer(
          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        ),
        buildSplitter('Yesterday'),
        TransactionContainer(
          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        ),
        TransactionContainer(
          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        ),
      ],
      // children: List.generate(30, 
      //   (index) {
      //     return TransactionContainer(
      //       margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
      //     );
      //   }
      // )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTabs(),
          buildSearch(),
          Expanded(
            child: SingleChildScrollView(
              child: buildTransactions()
            )
          )
        ],
      ),
    );
  }
}