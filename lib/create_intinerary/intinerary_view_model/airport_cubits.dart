import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/Airport_states.dart';
import 'package:sarya/create_intinerary/model/air_port_response.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';
import 'package:sarya/helper/shared_prefs.dart';

class AirportCubits extends Cubit<AirportStates> {
  AirportCubits(): super(AirportInitial());

  Future getAirport({required searchKey}) async{
    try{
      emit(AirportLoading());

      var  res = await CreateIntineraryRepository.instance.getAirport(searchAirport: searchKey);
      var  listOfAirport  = res["response"];
      List<bool> listOfBool = await List.filled(listOfAirport.length, false);

      SharedPrefs pref = SharedPrefs();

      emit(AirportLoaded(airportResponse: listOfAirport, listOfBool: listOfBool));

    }catch(e){
      emit(const AirportFailure(error: ''));
    }
  }

}