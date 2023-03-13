import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sarya/home/home_view_model/itinerary_by_id_states.dart';
import 'package:sarya/home/itineraryByIDResponse.dart';

import '../../data/repository/shop_itinerary_repository/shop_itinerary_repository.dart';
import '../../pinLocationMap.dart';
import '../../utils/constant.dart';

class ItineraryByIDCubits extends Cubit<ItineraryByIDStates> {
  ItineraryByIDCubits() : super(ItineraryByIDInitial());

  Future getItineraryByID({required String itineraryID, required String callTyp}) async {
    try {

      print("call type..............$callTyp");
      if(callTyp == sold || callTyp == edit )
      {
        emit(ItineraryByIDLoading());


        final result = await ShopIntineraryRepository.instance
            .getCreatedItineraryByID(id: itineraryID);

        ItineraryByIDResponse idResponse = ItineraryByIDResponse.fromJson(
            result);

        List<List<FlagInformation>> list = [];

        if (idResponse.result == null) {
          emit(ItineraryByIDLoaded(
              byIDResult: idResponse.result ?? ByIDResult(), listOfLatLng: []));
          return;
        }
        if (idResponse.result!.days == null) {
          emit(ItineraryByIDLoaded(byIDResult: idResponse.result!, listOfLatLng: []));
          return;
        }
        for (int i = 0; i < idResponse.result!.days!.length; i++) {
          List<FlagInformation> listOFFlag = [];
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].breakfast!.images??[],
              title: '${idResponse.result!.days![i].breakfast!.name??''}',
              subTitle: '${idResponse.result!.days![i].breakfast!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].breakfast!.location!
                    .coordinates![1],
                idResponse.result!.days![i].breakfast!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].lunch!.images??[],
              title: '${idResponse.result!.days![i].lunch!.name??''}',
              subTitle: '${idResponse.result!.days![i].lunch!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].lunch!.location!
                    .coordinates![1],
                idResponse.result!.days![i].lunch!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].dinner!.images??[],
              title: '${idResponse.result!.days![i].dinner!.name??''}',
              subTitle: '${idResponse.result!.days![i].dinner!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].dinner!.location!
                    .coordinates![1],
                idResponse.result!.days![i].dinner!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].marketMallsStores!.images??[],
              title: '${idResponse.result!.days![i].marketMallsStores?.name??''}',
              subTitle: '${idResponse.result!.days![i].marketMallsStores!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].marketMallsStores!.location!
                    .coordinates![1],
                idResponse.result!.days![i].marketMallsStores!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].coffeeClubsLounges!.images??[],
              title: '${idResponse.result!.days![i].coffeeClubsLounges!.name??''}',
              subTitle: '${idResponse.result!.days![i].coffeeClubsLounges!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].coffeeClubsLounges!.location!
                    .coordinates![1],
                idResponse.result!.days![i].coffeeClubsLounges!.location!
                    .coordinates![0],
              )));

          list.add(listOFFlag);
        }

        emit(ItineraryByIDLoaded(
            byIDResult: idResponse.result!, listOfLatLng: list));

      }
      else  if(callTyp == purchase) {
        emit(ItineraryByIDLoading());


        final result = await ShopIntineraryRepository.instance
            .getPublicItineraryByID(id: itineraryID);

        ItineraryByIDResponse idResponse = ItineraryByIDResponse.fromJson(
            result);
        List<List<FlagInformation>> list = [];

        if (idResponse.result == null) {
          emit(ItineraryByIDLoaded(
              byIDResult: idResponse.result ?? ByIDResult(), listOfLatLng: []));
          return;
        }
        if (idResponse.result!.days == null) {
          emit(ItineraryByIDLoaded(
              byIDResult: idResponse.result!, listOfLatLng: []));
          return;
        }


        for (int i = 0; i < idResponse.result!.days!.length; i++) {
          List<FlagInformation> listOFFlag = [];
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].breakfast!.images??[],
              title: '${idResponse.result!.days![i].breakfast!.name??''}',
              subTitle: '${idResponse.result!.days![i].breakfast!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].breakfast!.location!
                    .coordinates![1],
                idResponse.result!.days![i].breakfast!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].lunch!.images??[],
              title: '${idResponse.result!.days![i].lunch!.name??''}',
              subTitle: '${idResponse.result!.days![i].lunch!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].lunch!.location!
                    .coordinates![1],
                idResponse.result!.days![i].lunch!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].dinner!.images??[],
              title: '${idResponse.result!.days![i].dinner!.name??''}',
              subTitle: '${idResponse.result!.days![i].dinner!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].dinner!.location!
                    .coordinates![1],
                idResponse.result!.days![i].dinner!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].marketMallsStores!.images??[],
              title: '${idResponse.result!.days![i].marketMallsStores!.name??''}',
              subTitle: '${idResponse.result!.days![i].marketMallsStores!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].marketMallsStores!.location!
                    .coordinates![1],
                idResponse.result!.days![i].marketMallsStores!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].coffeeClubsLounges!.images??[],
              title: '${idResponse.result!.days![i].coffeeClubsLounges!.name??''}',
              subTitle: '${idResponse.result!.days![i].coffeeClubsLounges!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].coffeeClubsLounges!.location!
                    .coordinates![1],
                idResponse.result!.days![i].coffeeClubsLounges!.location!
                    .coordinates![0],
              )));

          list.add(listOFFlag);
        }
        emit(ItineraryByIDLoaded(
            byIDResult: idResponse.result!, listOfLatLng: list));

      }
      else if(callTyp == start ){
        emit(ItineraryByIDLoading());


        final result = await ShopIntineraryRepository.instance
            .getPurchaseItineraryByID(id: itineraryID);

        ItineraryByIDResponse idResponse = ItineraryByIDResponse.fromJson(
            result);
        List<List<FlagInformation>> list = [];

        if (idResponse.result == null) {
          emit(ItineraryByIDLoaded(
              byIDResult: idResponse.result ?? ByIDResult(), listOfLatLng: []));
          return;
        }
        if (idResponse.result!.days == null) {
          emit(ItineraryByIDLoaded(
              byIDResult: idResponse.result!, listOfLatLng: []));
          return;
        }

        print("idResponse.result!.days!.length............${idResponse.result!
            .days!.length}");

        for (int i = 0; i < idResponse.result!.days!.length; i++) {
          List<FlagInformation> listOFFlag = [];
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].breakfast!.images??[],
              title: '${idResponse.result!.days![i].breakfast!.name??''}',
              subTitle: '${idResponse.result!.days![i].breakfast!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].breakfast!.location!
                    .coordinates![1],
                idResponse.result!.days![i].breakfast!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].lunch!.images??[],
              title: '${idResponse.result!.days![i].lunch!.name??''}',
              subTitle: '${idResponse.result!.days![i].lunch!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].lunch!.location!
                    .coordinates![1],
                idResponse.result!.days![i].lunch!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].dinner!.images??[],
              title: '${idResponse.result!.days![i].dinner!.name??''}',
              subTitle: '${idResponse.result!.days![i].dinner!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].dinner!.location!
                    .coordinates![1],
                idResponse.result!.days![i].dinner!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].marketMallsStores!.images??[],
              title: '${idResponse.result!.days![i].marketMallsStores!.name??''}',
              subTitle: '${idResponse.result!.days![i].marketMallsStores!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].marketMallsStores!.location!
                    .coordinates![1],
                idResponse.result!.days![i].marketMallsStores!.location!
                    .coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: idResponse.result!.days![i].coffeeClubsLounges!.images??[],
              title: '${idResponse.result!.days![i].coffeeClubsLounges!.name??''}',
              subTitle: '${idResponse.result!.days![i].coffeeClubsLounges!.comments??''}',
              latLng: LatLng(
                idResponse.result!.days![i].coffeeClubsLounges!.location!
                    .coordinates![1],
                idResponse.result!.days![i].coffeeClubsLounges!.location!
                    .coordinates![0],
              )));

          list.add(listOFFlag);
        }


        emit(ItineraryByIDLoaded(
            byIDResult: idResponse.result!, listOfLatLng: list, state: idResponse.state));
      }
      else{

      }
    } catch (e) {
      print("catch.............${e.toString()}");
      emit(const ItineraryByIDFailure(error: ''));
    }
  }
}