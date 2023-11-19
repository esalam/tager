
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Tager/Presentation/home_tager/presentation/home_screen/home_screen.dart';
import 'add_location/location_helper.dart';
import 'branches/branches_model.dart';
import 'Tager/core/const/dioHelper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context)=>BlocProvider.of(context);
  BranchesModel ?branchesModel ;
  void getBranches(context)
  {
    emit(AppGetBranchesLoadingState());
    DioHelper.getData(url:"get_branches").then((value) {
      if(value.data["status"]==true){
        branchesModel=BranchesModel.fromJson(value.data);
      }else{
        Navigator.push(context,MaterialPageRoute(builder: (context) =>HomeScreen(),));
      }
      emit(AppGetBranchesSuccessState());

    }).catchError((error){
      emit(AppGetBranchesErrorState());

      print(error.toString());
    });

  }
  /////////////////////////////////////////////////////////////////////////////
  // void addLocation(){
  //   emit(AppAddLocationLoadingState());
  //   DioHelper.postData(url:"add_location",data: {
  //     "lat":56,
  //     "long":56,
  //     "place":"ff",
  //     "address":"ccc",
  //   }).then((value) {
  //     print(value.data);
  //     emit(AppAddLocationSuccessState());
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(AppAddLocationErrorState());
  //   });
  //
  //
  // }

  Position? position;
  LatLng? newPosition;
  String? city;
  String? address;
  final Completer<GoogleMapController> controller = Completer();
  Set<Marker> markers = {};

  Future<void> getCurrentLocation(context)async{
    emit(AppGetLocationLoadingState());
    await LocationHelper.getCurrentLocation(context);
    position = await Geolocator.getCurrentPosition().whenComplete((){
      emit(AppGetLocationSuccessState());
    });
  }
  setAddress(address){
    this.address=address;
    emit(AddAddressState());
  }

  setCity(city){
    this.city=city;
    emit(AddCityState());
  }

  void addLocation(){
    emit(AppAddLocationLoadingState());
    DioHelper.postData(
      url: "add_location",
      data: {
        "lat":"${newPosition?.latitude?? position?.latitude}",
        "long":"${newPosition?.longitude??position?.longitude}",
        "place":city,
        "address":address
      },
    ).then((value) {
      Fluttertoast.showToast(
          msg: 'Added Location Successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(AppAddLocationSuccessState());
    }).catchError((error) {
      print(error.toString());

      emit(AppAddLocationErrorState());
    });
  }



  CameraPosition getCurrentCameraPosition(){
    final CameraPosition currentCameraPosition = CameraPosition(
        bearing: 0,
        zoom: 17,
        tilt: 0,
        target: LatLng(position!.latitude,position!.longitude)
    );
    return currentCameraPosition;
  }


  Future<void> goToMyCurrentLocation() async{

    emit(AppGetLocationLoadingState());
    final GoogleMapController controler = await controller.future;
    markers={};
    newPosition=null;
    controler.animateCamera(CameraUpdate.newCameraPosition(getCurrentCameraPosition())).then((value) =>  emit(AppGetLocationSuccessState()));

  }

  void onMapTapped(LatLng tappedLocation) async {
    final GoogleMapController controler = await controller.future;

    // Update the camera position
    controler.animateCamera(CameraUpdate.newLatLng(tappedLocation));
    newPosition=tappedLocation;
    if(markers.isEmpty){
      markers.add(Marker(markerId: const MarkerId("1"),position: tappedLocation));
    }else{
      markers={};
      markers.add(Marker(markerId: const MarkerId("1"),position: tappedLocation));
    }
    emit(AppMarkerUpdateState());

    // Optionally, update the state to trigger a rebuild with the new location


  }

}
