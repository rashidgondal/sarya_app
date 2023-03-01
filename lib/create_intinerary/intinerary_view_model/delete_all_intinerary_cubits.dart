import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/create_intinerary_states.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/Delete_intinerary_states.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/delete_intinerary_states.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';
import '../../home/home_view_model/draft_itinerary_cubits.dart';
import 'all_delete_intinerary_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllDeleteIntineraryCubits extends Cubit<AllDeleteIntineraryStates> {
  AllDeleteIntineraryCubits() : super(AllDeleteIntineraryInitial());

  Future allDeleteIntinerary() async {
    try {
      emit(AllDeleteIntineraryLoading());

      var data = await CreateIntineraryRepository
          .instance.allDraftDeleteItinerary();

      emit(AllDeleteIntineraryLoaded());

    } catch (e) {

      emit(const AllDeleteIntineraryFailure(error: ''));
    }
  }
}