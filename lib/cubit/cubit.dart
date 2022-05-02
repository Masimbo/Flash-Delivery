import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app11/ui_design/etlb.dart';
import 'package:flutter_app11/ui_design/grid_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';


class Talab extends Cubit<TalabStates> {
  Talab() : super(InitialState());

  static Talab getObject(context) => BlocProvider.of(context);

  int currentIndex = 0;
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController restorantName = TextEditingController();
  TextEditingController talbDetails = TextEditingController();
  TextEditingController customerAddress = TextEditingController();

  List<String> titles = [
    'طلباتك',
    'اطلب',
  ];

  List<Widget> pages = [
    GridHome(),
    Etlb(),
  ];
  List<String> gridImage = [
    'assets/img/restorant.jpg',
    'assets/img/delivary.jpg',
    'assets/img/pharmacy.jpg',
    'assets/img/supermarket.jpg',
    'assets/img/toktok.jpg',
    'assets/img/services.jpg',
  ];
  List<String> imageTitles = [
    'مطاعم',
    'توصيل طرد',
    'صيدليات',
    'سوبر ماركت',
    'مشوار',
    'خدمات',
  ];
  List<String> imageSubTitles = [
    'جميع المطاعم والمحلات',
    'توصيل بضائع توصيل نقل عفش',
    'صيدليات  مراكز اشعه',
    'احتياجات السوق خضار فاكهه',
    'اركب توكتوك',
    'نجار كهربائي فني تكيفات',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavIndexState());
  }

  navigat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Etlb()),
    );
    emit(NavigateState());
  }

  changeState(TalabStates state) {
    emit(state);
  }


}
