import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tager/app_cubit.dart';


class CustomGoogleMap extends StatelessWidget {
  const CustomGoogleMap({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 135,
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Stack(
            children: [
              cubit.position != null ? GoogleMap(
                markers: cubit.markers,
                mapType: MapType.normal,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                initialCameraPosition: cubit.getCurrentCameraPosition(),
                onMapCreated: (GoogleMapController controller) {
                  cubit.controller.complete(controller);
                },
              ) : const Center(
                child: CircularProgressIndicator(color: Colors.amber,),),
            ],
          );
        },
      ),
    );
  }
}
