import 'package:flutter/material.dart';
import 'package:flutter_app11/cubit/cubit.dart';
import 'package:flutter_app11/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Talab(),
      child: BlocConsumer<Talab, TalabStates>(
        listener: (context, state) {},
        builder: (context, state) {
          Talab cubit = Talab.getObject(context); //object from cubit
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    '${cubit.titles[cubit.currentIndex]}',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  elevation: 0.0,
                ),
                body: cubit.pages[cubit.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  elevation: 0.0,
                  currentIndex: cubit.currentIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) => cubit.changeIndex(index),
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                        ),
                        label: 'الرئيسيه'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.question_answer,
                        ),
                        label: 'اطلب'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
