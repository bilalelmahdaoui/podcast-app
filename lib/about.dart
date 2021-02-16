import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './ui/AppLogo.dart';
import './ui/AppStyles.dart';


class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)
                  ),
                  gradient: LinearGradient(
                    colors: [AppStyles.primaryColor, AppStyles.primaryColorDark],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff676B76).withOpacity(0.7),
                      blurRadius: 40,
                      offset: Offset(0, 10),
                      spreadRadius: -15,

                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(margin: EdgeInsets.only(top:0), child: AppLogo()),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "About",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: AppStyles.tertiaryColor),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 450,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                        children: [
                          Row (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("App Version", style: TextStyle(fontSize: 15),),
                            Text("1.0.1", style: TextStyle(color: Colors.grey),)],),
                          Divider(height: 30, indent: 0, endIndent: 0, color: Colors.grey, thickness: 0.2,),
                          //
                          Row (
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Last update", style: TextStyle(fontSize: 15),),
                              Text("15/02/2020", style: TextStyle(color: Colors.grey),)],),
                          Divider(height: 30, indent: 0, endIndent: 0, color: Colors.grey, thickness: 0.2,),
                          //
                          Row (
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Developer", style: TextStyle(fontSize: 15),),
                              Text("Bilal El Mahdaoui", style: TextStyle(color: Colors.grey),)],),
                          Divider(height: 30, indent: 0, endIndent: 0, color: Colors.grey, thickness: 0.2,),
                          //
                          Row (
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Github", style: TextStyle(fontSize: 15),),
                              Text("github.com/bilalelmahdaoui", style: TextStyle(color: Colors.grey),)],),
                          Divider(height: 30, indent: 0, endIndent: 0, color: Colors.grey, thickness: 0.2,),
                          //
                          Row (
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Institution", style: TextStyle(fontSize: 15),),
                              Text("IMT Lille Douai", style: TextStyle(color: Colors.grey),)],),
                          Divider(height: 30, indent: 0, endIndent: 0, color: Colors.grey, thickness: 0.2,),
                        ]
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}