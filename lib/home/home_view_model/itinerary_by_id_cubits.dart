import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sarya/home/home_view_model/itinerary_by_id_states.dart';
import 'package:sarya/home/itineraryByIDResponse.dart';

import '../../data/repository/shop_itinerary_repository/shop_itinerary_repository.dart';
import '../../pinLocationMap.dart';
import '../../utils/constant.dart';

class ItineraryByIDCubits extends Cubit<ItineraryByIDStates> {
  ItineraryByIDCubits() : super(ItineraryByIDInitial());

  Future getItineraryByID(
      {required String itineraryID, required String callTyp}) async {
    try {
      print("call type..............$callTyp");
      if (callTyp == sold || callTyp == edit) {
        emit(ItineraryByIDLoading());

        final result = await ShopIntineraryRepository.instance
            .getCreatedItineraryByID(id: itineraryID);

        ItineraryByIDResponse idResponse =
            ItineraryByIDResponse.fromJson(result);

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
        emit(ItineraryByIDLoaded(
            byIDResult: idResponse.result!, listOfLatLng: []));
      } else if (callTyp == purchase) {
        emit(ItineraryByIDLoading());

        final result = await ShopIntineraryRepository.instance
            .getPublicItineraryByID(id: itineraryID);

        ItineraryByIDResponse idResponse =
            ItineraryByIDResponse.fromJson(result);

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
        emit(ItineraryByIDLoaded(
            byIDResult: idResponse.result!, listOfLatLng: []));
      } else if (callTyp == start) {
        emit(ItineraryByIDLoading());

        final result = await ShopIntineraryRepository.instance
            .getPurchaseItineraryByID(id: itineraryID);

        ItineraryByIDResponse idResponse =
            ItineraryByIDResponse.fromJson(result);
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

        print(
            "idResponse.result!.days!.length............${idResponse.result!.days!.length}");

        for (int i = 0; i < idResponse.result!.days!.length; i++) {
          List<FlagInformation> listOFFlag = [];
          listOFFlag.add(FlagInformation(
              list_of_images: [
                'https://staging.housy.ae/public/uploads/all/sbb6vTwS5AR1BHViykqVSThJT9rJ6VNh9YlH5QyY.jpg',
                'https://staging.housy.ae/public/uploads/all/4I68x6WhN0T3y4aBauuAZB4YO9RI9bWOFguTqXH0.jpg',
                'https://staging.housy.ae/public/uploads/all/Z9dmjnZlN4WFKU3OHaB10ukuZoZ69EvXvxjBREHi.jpg',
                'https://staging.housy.ae/public/uploads/all/Qmif7bQuIRJDepBm4vIAfyZ6nLKQ9FjOx5Ks0Jeo.jpg',
                'https://staging.housy.ae/public/uploads/all/gpX5gfdSEFjSoxSrtMOj1Ov6Gx174vUffkNvwHaA.jpg'
              ],
              title: 'CZN Dubai breakfast',
              subTitle: 'This is the information of CZN Bank Dubai',
              latLng: LatLng(
                idResponse
                    .result!.days![i].breakfast!.location!.coordinates![1],
                idResponse
                    .result!.days![i].breakfast!.location!.coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: [
                'https://staging.housy.ae/public/uploads/all/sbb6vTwS5AR1BHViykqVSThJT9rJ6VNh9YlH5QyY.jpg',
                'https://staging.housy.ae/public/uploads/all/4I68x6WhN0T3y4aBauuAZB4YO9RI9bWOFguTqXH0.jpg',
                'https://staging.housy.ae/public/uploads/all/Z9dmjnZlN4WFKU3OHaB10ukuZoZ69EvXvxjBREHi.jpg',
                'https://staging.housy.ae/public/uploads/all/Qmif7bQuIRJDepBm4vIAfyZ6nLKQ9FjOx5Ks0Jeo.jpg',
                'https://staging.housy.ae/public/uploads/all/gpX5gfdSEFjSoxSrtMOj1Ov6Gx174vUffkNvwHaA.jpg'
              ],
              title: 'CZN Dubai lunch',
              subTitle: 'This is the information of CZN Bank Dubai',
              latLng: LatLng(
                idResponse.result!.days![i].lunch!.location!.coordinates![1],
                idResponse.result!.days![i].lunch!.location!.coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: [
                'https://staging.housy.ae/public/uploads/all/sbb6vTwS5AR1BHViykqVSThJT9rJ6VNh9YlH5QyY.jpg',
                'https://staging.housy.ae/public/uploads/all/4I68x6WhN0T3y4aBauuAZB4YO9RI9bWOFguTqXH0.jpg',
                'https://staging.housy.ae/public/uploads/all/Z9dmjnZlN4WFKU3OHaB10ukuZoZ69EvXvxjBREHi.jpg',
                'https://staging.housy.ae/public/uploads/all/Qmif7bQuIRJDepBm4vIAfyZ6nLKQ9FjOx5Ks0Jeo.jpg',
                'https://staging.housy.ae/public/uploads/all/gpX5gfdSEFjSoxSrtMOj1Ov6Gx174vUffkNvwHaA.jpg'
              ],
              title: 'CZN Dubai dinner',
              subTitle: 'This is the information of CZN Bank Dubai',
              latLng: LatLng(
                idResponse.result!.days![i].dinner!.location!.coordinates![1],
                idResponse.result!.days![i].lunch!.location!.coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: [
                'https://staging.housy.ae/public/uploads/all/sbb6vTwS5AR1BHViykqVSThJT9rJ6VNh9YlH5QyY.jpg',
                'https://staging.housy.ae/public/uploads/all/4I68x6WhN0T3y4aBauuAZB4YO9RI9bWOFguTqXH0.jpg',
                'https://staging.housy.ae/public/uploads/all/Z9dmjnZlN4WFKU3OHaB10ukuZoZ69EvXvxjBREHi.jpg',
                'https://staging.housy.ae/public/uploads/all/Qmif7bQuIRJDepBm4vIAfyZ6nLKQ9FjOx5Ks0Jeo.jpg',
                'https://staging.housy.ae/public/uploads/all/gpX5gfdSEFjSoxSrtMOj1Ov6Gx174vUffkNvwHaA.jpg'
              ],
              title: 'CZN Dubai coffeeClubsLounges',
              subTitle: 'This is the information of CZN Bank Dubai',
              latLng: LatLng(
                idResponse.result!.days![i].coffeeClubsLounges!.location!
                    .coordinates![1],
                idResponse.result!.days![i].lunch!.location!.coordinates![0],
              )));
          listOFFlag.add(FlagInformation(
              list_of_images: [
                'https://staging.housy.ae/public/uploads/all/sbb6vTwS5AR1BHViykqVSThJT9rJ6VNh9YlH5QyY.jpg',
                'https://staging.housy.ae/public/uploads/all/4I68x6WhN0T3y4aBauuAZB4YO9RI9bWOFguTqXH0.jpg',
                'https://staging.housy.ae/public/uploads/all/Z9dmjnZlN4WFKU3OHaB10ukuZoZ69EvXvxjBREHi.jpg',
                'https://staging.housy.ae/public/uploads/all/Qmif7bQuIRJDepBm4vIAfyZ6nLKQ9FjOx5Ks0Jeo.jpg',
                'https://staging.housy.ae/public/uploads/all/gpX5gfdSEFjSoxSrtMOj1Ov6Gx174vUffkNvwHaA.jpg'
              ],
              title: 'CZN Dubai marketMallsStores',
              subTitle: 'This is the information of CZN Bank Dubai',
              latLng: LatLng(
                idResponse.result!.days![i].marketMallsStores!.location!
                    .coordinates![1],
                idResponse.result!.days![i].lunch!.location!.coordinates![0],
              )));

          list.add(listOFFlag);
        }

        /* for (int i = 0; i < idResponse.result!.days!.length; i++) {
          list.add(FlagInformation(
              list_of_images: [
                'https://staging.housy.ae/public/uploads/all/sbb6vTwS5AR1BHViykqVSThJT9rJ6VNh9YlH5QyY.jpg',
                'https://staging.housy.ae/public/uploads/all/4I68x6WhN0T3y4aBauuAZB4YO9RI9bWOFguTqXH0.jpg',
                'https://staging.housy.ae/public/uploads/all/Z9dmjnZlN4WFKU3OHaB10ukuZoZ69EvXvxjBREHi.jpg',
                'https://staging.housy.ae/public/uploads/all/Qmif7bQuIRJDepBm4vIAfyZ6nLKQ9FjOx5Ks0Jeo.jpg',
                'https://staging.housy.ae/public/uploads/all/gpX5gfdSEFjSoxSrtMOj1Ov6Gx174vUffkNvwHaA.jpg'
              ],
              title: 'CZN Dubai breakfast',
              subTitle: 'This is the information of CZN Bank Dubai',
              latLng: LatLng(
                idResponse.result!.days![i].breakfast!.location!
                    .coordinates![1],
                idResponse.result!.days![i].breakfast!.location!
                    .coordinates![0],
              )));
          list.add(FlagInformation(
              list_of_images: [
                'https://staging.housy.ae/public/uploads/all/sbb6vTwS5AR1BHViykqVSThJT9rJ6VNh9YlH5QyY.jpg',
                'https://staging.housy.ae/public/uploads/all/4I68x6WhN0T3y4aBauuAZB4YO9RI9bWOFguTqXH0.jpg',
                'https://staging.housy.ae/public/uploads/all/Z9dmjnZlN4WFKU3OHaB10ukuZoZ69EvXvxjBREHi.jpg',
                'https://staging.housy.ae/public/uploads/all/Qmif7bQuIRJDepBm4vIAfyZ6nLKQ9FjOx5Ks0Jeo.jpg',
                'https://staging.housy.ae/public/uploads/all/gpX5gfdSEFjSoxSrtMOj1Ov6Gx174vUffkNvwHaA.jpg'
              ],
              title: 'CZN Dubai lunch',
              subTitle: 'This is the information of CZN Bank Dubai',
              latLng: LatLng(
                idResponse.result!.days![i].lunch!.location!.coordinates![1],
                idResponse.result!.days![i].lunch!.location!.coordinates![0],
              )));
          list.add(FlagInformation(
              list_of_images: [
                'https://staging.housy.ae/public/uploads/all/sbb6vTwS5AR1BHViykqVSThJT9rJ6VNh9YlH5QyY.jpg',
                'https://staging.housy.ae/public/uploads/all/4I68x6WhN0T3y4aBauuAZB4YO9RI9bWOFguTqXH0.jpg',
                'https://staging.housy.ae/public/uploads/all/Z9dmjnZlN4WFKU3OHaB10ukuZoZ69EvXvxjBREHi.jpg',
                'https://staging.housy.ae/public/uploads/all/Qmif7bQuIRJDepBm4vIAfyZ6nLKQ9FjOx5Ks0Jeo.jpg',
                'https://staging.housy.ae/public/uploads/all/gpX5gfdSEFjSoxSrtMOj1Ov6Gx174vUffkNvwHaA.jpg'
              ],
              title: 'CZN Dubai dinner',
              subTitle: 'This is the information of CZN Bank Dubai',
              latLng: LatLng(
                idResponse.result!.days![i].dinner!.location!.coordinates![1],
                idResponse.result!.days![i].lunch!.location!.coordinates![0],
              )));
          list.add(FlagInformation(
              list_of_images: [
                'https://staging.housy.ae/public/uploads/all/sbb6vTwS5AR1BHViykqVSThJT9rJ6VNh9YlH5QyY.jpg',
                'https://staging.housy.ae/public/uploads/all/4I68x6WhN0T3y4aBauuAZB4YO9RI9bWOFguTqXH0.jpg',
                'https://staging.housy.ae/public/uploads/all/Z9dmjnZlN4WFKU3OHaB10ukuZoZ69EvXvxjBREHi.jpg',
                'https://staging.housy.ae/public/uploads/all/Qmif7bQuIRJDepBm4vIAfyZ6nLKQ9FjOx5Ks0Jeo.jpg',
                'https://staging.housy.ae/public/uploads/all/gpX5gfdSEFjSoxSrtMOj1Ov6Gx174vUffkNvwHaA.jpg'
              ],
              title: 'CZN Dubai coffeeClubsLounges',
              subTitle: 'This is the information of CZN Bank Dubai',
              latLng: LatLng(
                idResponse.result!.days![i].coffeeClubsLounges!.location!
                    .coordinates![1],
                idResponse.result!.days![i].lunch!.location!.coordinates![0],
              )));
          list.add(FlagInformation(
              list_of_images: [
                'https://staging.housy.ae/public/uploads/all/sbb6vTwS5AR1BHViykqVSThJT9rJ6VNh9YlH5QyY.jpg',
                'https://staging.housy.ae/public/uploads/all/4I68x6WhN0T3y4aBauuAZB4YO9RI9bWOFguTqXH0.jpg',
                'https://staging.housy.ae/public/uploads/all/Z9dmjnZlN4WFKU3OHaB10ukuZoZ69EvXvxjBREHi.jpg',
                'https://staging.housy.ae/public/uploads/all/Qmif7bQuIRJDepBm4vIAfyZ6nLKQ9FjOx5Ks0Jeo.jpg',
                'https://staging.housy.ae/public/uploads/all/gpX5gfdSEFjSoxSrtMOj1Ov6Gx174vUffkNvwHaA.jpg'
              ],
              title: 'CZN Dubai marketMallsStores',
              subTitle: 'This is the information of CZN Bank Dubai',
              latLng: LatLng(
                idResponse.result!.days![i].marketMallsStores!.location!
                    .coordinates![1],
                idResponse.result!.days![i].lunch!.location!.coordinates![0],
              )));
        }*/
        emit(ItineraryByIDLoaded(
            byIDResult: idResponse.result!, listOfLatLng: list));
      } else {}
    } catch (e) {
      print("catch.............${e.toString()}");
      emit(const ItineraryByIDFailure(error: ''));
    }
  }
}
