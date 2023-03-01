import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/delete_intinerary_states.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';


class DeleteIntineraryCubits extends Cubit<DeleteIntineraryStates> {
  DeleteIntineraryCubits() : super(DeleteIntineraryInitial());

  Future deleteIntineraryByID(
      {required itineraryId}) async {
    try {
      emit(DeleteIntineraryLoading());

      var data = await CreateIntineraryRepository
          .instance.deleteItinerary(itineraryID: itineraryId);
      emit(DeleteIntineraryLoaded());

    } catch (e) {

      emit(const DeleteIntineraryFailure(error: ''));
    }
  }
}