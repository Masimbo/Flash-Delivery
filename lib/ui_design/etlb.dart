import 'package:flutter/material.dart';
import 'package:flutter_app11/cubit/cubit.dart';
import 'package:flutter_app11/order_cubit/order_cubit.dart';
import 'package:flutter_app11/order_cubit/order_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Etlb extends StatelessWidget {
  @override
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController details = TextEditingController();
  Widget build(BuildContext context) {
    OrderCubit orderCubit;
    return BlocProvider(create: (context)=>OrderCubit(),
    child: BlocConsumer<OrderCubit,OrderStates>(
        listener: (context,state){
          if(state is OrderSuccessState){
            name.clear();
            address.clear();
            details.clear();
            phone.clear();
            successDialog(context, state.message);
          }
        },
      builder: (context,state){
          orderCubit = OrderCubit.get(context);
      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اكتب اسم الخدمه',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: 'اكتب اسم الخدمه',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'رجاءا ادخل بيانات';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'اكتب تفاصيل طلبك ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: details,
                      decoration: InputDecoration(
                        labelText: 'اكتب تفاصيل طلبك ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'رجاءا ادخل بيانات';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'اكتب عنوانك ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: address,
                      decoration: InputDecoration(
                        labelText: 'عنوانك',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'رجاءا ادخل بيانات';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'اكتب رقم الهاتف ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phone,
                      decoration: InputDecoration(

                        labelText: 'رقم الهاتف',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'رجاءا ادخل بيانات';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Center(
                      child: Container(
                        width: 200.0,
                        color: Colors.teal,
                        child: TextButton(
                          onPressed: () {
                            //cubit.changeState(ValidationState());
                            if (_formKey.currentState!.validate()) {
                              orderCubit.order(name.text, address.text, details.text, phone.text);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              ' ارسال طلب',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } , ),);
  }

  successDialog(BuildContext context,String message){
    showDialog(context: context, builder: (context){
      return Dialog(
        child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message,
                style: TextStyle(
                fontSize: 20
              ),),

            ],
          ),
        ),
      );
    });
  }
}
