import 'dart:io';
import 'package:blood_bank_app/src/BloodStock.dart';
import 'package:blood_bank_app/src/HttpService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class bloodstock extends StatefulWidget {
  bloodstock(this.branchId ,this.full_Name_of_Blood_Bank, this.address, this.pincode);
  String branchId;
  String full_Name_of_Blood_Bank;
  String address;
  String pincode;

  @override
  State<StatefulWidget> createState() => new _bloodstock(branchId ,full_Name_of_Blood_Bank, address, pincode);
}
class _bloodstock extends State<bloodstock> {
  _bloodstock(this.branchId ,this.full_Name_of_Blood_Bank, this.address, this.pincode);
  String branchId;
  String full_Name_of_Blood_Bank;
  String address;
  String pincode;
  bool _is_internet_connected = false;
  List<BloodStock> blood_stock = [];
  @override
  void initState() {
    super.initState();
    CheckInternetConnection().then((value) async {
      if(_is_internet_connected){
        showProgress(context);
        try {
          await GetBloodStock();
        }
        catch(Exception){

        }
        finally{
          Navigator.pop(context);
        }
      }else{
        showAlertDialogInternet(context,"Error","Internet connection not available. Please connect internet");
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () async => true,
        child:

         Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            title: Text("BLOOD BANK"),
            centerTitle: true,
            backgroundColor: Colors.blue[900],
            automaticallyImplyLeading: false,
          ),
          body: Column(

            children: <Widget>[
              Container(height: 10,color: Colors.black12,),
              Container(
                  alignment: Alignment.center,
                  color: Colors.black12,
                  child: Text(
                    full_Name_of_Blood_Bank,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  )),
              Container(
                  alignment: Alignment.center,
                  color: Colors.black12,
                  child: Text(
                    address,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  )),
              Container(
                  alignment: Alignment.center,
                  color: Colors.black12,
                  child: Text(
                    'PIN Code : ' + pincode,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  )),
              Container(height: 10,color: Colors.black12,),
              Expanded(
                child:ListView.builder(
                  padding: const EdgeInsets.all(5.5),
                  itemCount: blood_stock == null ? 0:blood_stock.length,
                  itemBuilder: _itemBuilder,
                ),
              ),
            ],
          ),

        )
    );

  }
  Widget _itemBuilder(BuildContext context, int index) {
    return InkWell(
      child: Card(
          child:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      color: const Color(0xffbedbff),
                      child: Text(
                        blood_stock[index].productName.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      )),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                            child: const Text(
                              "A Positive :",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              blood_stock[index].grpAPositive.toString(),
                              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1, child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: const Text(
                              "A Negative :",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                                blood_stock[index].grpANegative.toString(),
                              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                    ],
                  ),
                  Container(height: 5,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: const Text(
                              "B Positive :",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              blood_stock[index].grpBPositive.toString(),
                              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1, child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: const Text(
                              "B Negative :",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              blood_stock[index].grpBNegative.toString(),
                              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                    ],
                  ),
                  Container(height: 5,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: const Text(
                              "AB Positive :",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              blood_stock[index].grpABPositive.toString(),
                              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1, child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: const Text(
                              "AB Negative :",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              blood_stock[index].grpABNegative.toString(),
                              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                    ],
                  ),
                  Container(height: 5,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: const Text(
                              "O Positive :",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              blood_stock[index].grpOPositive.toString(),
                              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1, child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: const Text(
                              "O Negative :",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              blood_stock[index].grpONegative.toString(),
                              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                    ],
                  ),
                  Container(height: 5,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: const Text(
                              "OH Positive :",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              blood_stock[index].grpOHPositive.toString(),
                              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1, child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: const Text(
                              "OH Negative :",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              blood_stock[index].grpOHNegative.toString(),
                              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                    ],
                  ),
                ]
            ),
          )
      ),

    );
  }

  Future<void> GetBloodStock()   async {
    final HttpService httpService = HttpService();
    List<BloodStock> list= await httpService.getBloodStock(this.branchId) as List<BloodStock>;
    setState(() {
      blood_stock = list;
    });

  }
  Future CheckInternetConnection()
  async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _is_internet_connected = true;
      }
    } on SocketException catch (_) {
      _is_internet_connected = false;
    }
  }

  showAlertDialogInternet(BuildContext context, String title,String content) {

    // set up the buttons
    Widget okButton = TextButton(
      child: Text("Ok"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showProgress(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5),child:Text("Please wait .." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}

