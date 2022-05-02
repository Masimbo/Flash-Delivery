import 'package:dio/dio.dart';
import 'package:flutter_app11/model/OrderModel.dart';
import 'package:flutter_app11/order_cubit/order_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderStates>{

  OrderCubit() : super(OrderInitialStates());

  static OrderCubit get(context)=> BlocProvider.of(context);

  Dio dio = Dio();
  OrderModel? orderModel;

  order(String name,String address,String details,String phone) async {
    await dio.post("https://flashexpressapp.com/app/api/v1/customer/order/place_new_order",
    queryParameters: {
      "name" : name,
      "address" : address,
      "details" : details,
      "phone" : phone
    }).then((value){
      orderModel = OrderModel.fromJson(value.data);
      print(orderModel!.message);
      emit(OrderSuccessState(orderModel!.message.toString()));
    }).catchError((e){
      print(e);
      emit(OrderFailedState());
    });
  }
}