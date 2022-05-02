import 'package:flutter/material.dart';
import 'package:flutter_app11/cubit/cubit.dart';

import 'etlb.dart';

class GridHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey gesterKey = GlobalKey();
    Talab cubit = Talab.getObject(context); //object from cubit
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: List.generate(
            6,
            (index) => GestureDetector(
              //key: gesterKey,
              onTap: () {
                //cubit.navigat(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple[900],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        cubit.gridImage[index],
                        height: 50.0,
                      ),
                    ),
                    Text(
                      cubit.imageTitles[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      cubit.imageSubTitles[index],
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
