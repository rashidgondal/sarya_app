import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';
import 'package:sarya/helper/shared_prefs.dart';
import '../model/trip_response.dart';
import 'Trip_states.dart';

class TripCubits extends Cubit<TripStates> {
  TripCubits(): super(TripInitial());

  Future getTrip() async{
    try{
      emit(TripLoading());

      final TripResponse  res = await CreateIntineraryRepository.instance.trip();
      List<bool> listOfBool = await List.filled(res.result!.length, false);
      emit(TripLoaded(response: res, listOfBool: listOfBool));

    }catch(e){
      emit(const TripFailure(error: ''));
    }
  }

}