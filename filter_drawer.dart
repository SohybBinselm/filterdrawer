import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<bool> checkValGovernorate = [false,false,false,false,false,false,false,false];
  List<bool> checkValCategories = [false,false,false,false,false,false,false,false,false,false,false,false];
  List<bool> checkValBookOwner = [false,false];
  List<String> governorates = ["Cairo", "Luxor" , "Giza", "Sharkia", "Dakahlia", "Aswan", "Tanta"];
  List<String> categories = ["history", "science" , "religon","Literature","poetry","a","b","c","c","c","c","c"];
  List<String> bookOwner = ["Libray","Readers"];
  List<String> chosenGovernorates = [];
  List<String> chosenCategories = [];
  List<String> chosenBookOwner = [];

  checkGovernorateOnChanged(int idx, bool val) {
    setState(() {
      checkValGovernorate[idx] = val;
//      val ? chosenGovernorates.add(governorates[idx]) : chosenGovernorates.removeAt(idx);
    });
  }

  checkCategoriesOnChanged(int idx, bool val) {
    setState(() {
      checkValCategories[idx] = val;
//      val ? chosenCategories.add(categories[idx]) : chosenCategories.removeAt(idx);

    });
  }

  checkBookOwnerOnChanged(int idx, bool val) {
    setState(() {
      checkValBookOwner[idx] = val;
//      val ? chosenBookOwner.add(bookOwner[idx]) : chosenBookOwner.removeAt(idx);
    });
  }
//################################################################
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 45,
              color: Color(0xFFFBC02D),
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        backgroundColor: Color.fromRGBO(63, 61, 86, 1),
        title: Text(
          'Logo',
          style: TextStyle(
            color: Color.fromRGBO(251, 192, 45, 1),
            fontSize: 22,
          ),
        ),
        actions: <Widget>[
          Container(
            width: 160,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(
              left: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  bottom: 5,
                  top: 5,
                ),
                icon: Icon(
                  Icons.search,
                  size: 35,
                  color: Color.fromRGBO(251, 192, 45, 1),
                ),
                hintText: 'Search ',
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Color.fromRGBO(251, 192, 45, 1),
              size: 37,
            ),
            onPressed: () {},
          ),
        ],
      ),
      //DRAWER SECTION##################################################################
      drawer: Drawer(
        child: Container(
          color: Color.fromRGBO(46, 43, 72, 1),
          child: Column(
            children: <Widget>[
              AppBar(
                backgroundColor: Color.fromRGBO(63, 61, 86, 1),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Color.fromRGBO(251, 192, 45, 1),
                  ),
                  onPressed: ()=>Navigator.pop(context),
                ),
                title: Text(
                  'Filter books',
                  style: TextStyle(color: Color(0xFFFBC02D), fontSize: 23),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    width: 37,
                    height: 117,
                    decoration: BoxDecoration(
                      color: Color(0xFFFBC02D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      child: Image.asset('images/bank.png'),
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 5),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0,bottom: 10),
                          child: Text(
                            "Governorates",
                            style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 17),
                          ),
                        ),
                        Container(
                          height: 80,
                          child: ListView.builder(itemCount:governorates.length,itemBuilder: (context,idx){
                            return checkBoxBuilder(idx,checkValGovernorate[idx], governorates[idx], checkGovernorateOnChanged);

                          }),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    width: 37,
                    height: 195,
                    decoration: BoxDecoration(
                      color: Color(0xFFFBC02D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      child: Image.asset('images/greenhouse.png'),
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 5),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0,bottom: 10),
                          child: Text(
                            "Categories",
                            style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 17),
                          ),
                        ),

                        Container(
                          height: 150,
                          child: ListView.builder(itemCount:categories.length,itemBuilder: (context,idx){
                            return checkBoxBuilder(idx,checkValCategories[idx], categories[idx], checkCategoriesOnChanged);

                          }),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    width: 37,
                    height: 98,
                    decoration: BoxDecoration(
                      color: Color(0xFFFBC02D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      child: Image.asset('images/study.png'),
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 5),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0,bottom: 10),
                        child: Text(
                          "Book Owner",
                          style:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 17),
                        ),
                      ),
                      checkBoxBuilder(0,checkValBookOwner[0],"Library",checkBookOwnerOnChanged),
                      checkBoxBuilder(1,checkValBookOwner[1],"Readers",checkBookOwnerOnChanged),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 43,),
              Container(
                width: 140,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(0xfffac02e)),
                child: FlatButton(
                  child: Text(
                    "Filter",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: (){
                    //NAVIGATION SECTION + Chosen filters
                    for(int i=0 ; i<governorates.length;++i){
                      setState(() {
                        checkValGovernorate[i]?chosenGovernorates.add(governorates[i]):null;
                      });
                    }
                    for(int i=0 ; i<categories.length;++i){
                      setState(() {
                        checkValCategories[i]?chosenCategories.add(categories[i]):null;
                      });
                    }
                    for(int i=0 ; i<bookOwner.length;++i){
                      setState(() {
                        checkValBookOwner[i]?chosenBookOwner.add(bookOwner[i]):null;
                      });
                    }
                    print(''' 
                    $chosenGovernorates
                    $chosenCategories
                    $chosenBookOwner
                    ''');

                  },

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget checkBoxBuilder(int idx,bool val, String text,Function onChanged){
    return Container(
      height: 30,
      child: Row(
        children: <Widget>[
          Container(
            child: Checkbox(
              value: val,
              onChanged: (val) {
                onChanged(idx, val);
              },
              activeColor: Color(0xFFFBC02D),
            ),
          ),
          Text(
            "$text",
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}

