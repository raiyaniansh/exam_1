import 'package:exam_1/screen/task3/home/modal/home_modal.dart';
import 'package:exam_1/screen/task3/home/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderf;
  HomeProvider? homeProvidert;

  @override
  Widget build(BuildContext context) {
    homeProviderf = Provider.of<HomeProvider>(context, listen: false);
    homeProvidert = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          elevation: 0,
          title: Text("Corona Update"),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              var corona = snapshot.data;
              return Column(
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white30)),
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text("WorldTotal",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))),
                          SizedBox(height: 5,),
                          Container(height: 1,width: double.infinity,color: Colors.white30,),
                          SizedBox(height: 8,),
                          Text("Cases : ${corona!.worldTotal!.totalCases}",style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text("Deaths : ${corona.worldTotal!.totalDeaths}",style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text("TotalRecovered : ${corona.worldTotal!.totalRecovered}",style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text("ActiveCases : ${corona.worldTotal!.activeCases}",style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text("SeriousCritical : ${corona.worldTotal!.seriousCritical}",style: TextStyle(color: Colors.white,fontSize: 16),),
                        ],
                      )),
                  Text("Data by contry",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white30)),
                          child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(child: Text("${corona!.countriesStat![index].countryName}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))),
                                  SizedBox(height: 5,),
                                  Container(height: 1,width: double.infinity,color: Colors.white30,),
                                  SizedBox(height: 8,),
                                  Text("Cases : ${corona.countriesStat![index].cases}",style: TextStyle(color: Colors.white,fontSize: 16),),
                                  Text("Deaths : ${corona.countriesStat![index].deaths}",style: TextStyle(color: Colors.white,fontSize: 16),),
                                  Text("TotalRecovered : ${corona.countriesStat![index].totalRecovered}",style: TextStyle(color: Colors.white,fontSize: 16),),
                                  Text("ActiveCases : ${corona.countriesStat![index].activeCases}",style: TextStyle(color: Colors.white,fontSize: 16),),
                                  Text("SeriousCritical : ${corona.countriesStat![index].seriousCritical}",style: TextStyle(color: Colors.white,fontSize: 16),),
                                  Text("TotalTests : ${corona.countriesStat![index].totalTests}",style: TextStyle(color: Colors.white,fontSize: 16),),
                                ],
                              )),
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator(color: Colors.white12,));
          },
          future: homeProviderf!.getCoronaData(),
        ),
      ),
    );
  }
}
