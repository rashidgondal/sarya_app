import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/create_intinerary_states.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/navigation/navigation_service.dart';
import '../../navigation/router_path.dart';
import '../model/create_intinerary_request.dart';
import '../model/create_intinerary_response.dart';

class CreateIntineraryCubits extends Cubit<CreateIntineraryStates> {
  CreateIntineraryCubits(): super(CreateIntineraryInitial());

  Future createIntinerary({required CreateIntineraryRequest createIntineraryRequest, required NavigationService navigationService,required BuildContext context}) async{
    try{
      emit(CreateIntineraryLoading());
        print("1.........");
      var   resultData = await CreateIntineraryRepository.instance.createIntinerary(body: createIntineraryRequest.toJson());

      print("2.........$resultData");

      SharedPrefs pref = SharedPrefs();
      var map = resultData['result'];
      String id = map['_id'];
      pref.saveItineraryID(id);
      List<String> destination = createIntineraryRequest.destination??[];
      pref.saveDestinationCountries(destination);
      print("3.........");


      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Itinerary Created")));

      emit(CreateIntineraryLoaded());
      navigationService.navigateTo(designIntineraryRoute);

    }catch(e){
      print("1.........${e.toString()}");

      emit(const CreateIntineraryFailure(error: ''));
    }
  }

}