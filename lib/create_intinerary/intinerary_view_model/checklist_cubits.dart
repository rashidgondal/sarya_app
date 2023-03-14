import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/CheckList_states.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';
import 'package:sarya/helper/shared_prefs.dart';
import '../model/checklist_response.dart';

class CheckListCubits extends Cubit<CheckListStates> {
  CheckListCubits(): super(CheckListInitial());

  Future getCheckList() async{
    try{
      emit(CheckListLoading());

      final CheckListResponse  res = await CreateIntineraryRepository.instance.checkList();
      List<bool> listOfBool = await List.filled(res.result!.length, false);

      emit(CheckListLoaded(response: res, boolList: listOfBool));

    }catch(e){
      emit(const CheckListFailure(error: ''));
    }
  }

}