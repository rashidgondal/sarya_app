import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/transport_states.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';
import 'package:sarya/helper/shared_prefs.dart';
import '../model/transport_response.dart';

class TransportCubits extends Cubit<TransportStates> {
  TransportCubits(): super(TransportInitial());

  Future getTransport() async{
    try{
      emit(TransportLoading());

      final TransportResponse  res = await CreateIntineraryRepository.instance.transport();
      List<bool> listOfBool = await List.filled(res.result!.length, false);

      SharedPrefs pref = SharedPrefs();

      emit(TransportLoaded(response: res, listOfBool: listOfBool));

    }catch(e){
      emit(const TransportFailure(error: ''));
    }
  }

}