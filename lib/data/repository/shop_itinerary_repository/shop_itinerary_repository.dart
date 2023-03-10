import 'dart:developer';

import 'package:sarya/data/provider/sarya_api.dart';

class ShopIntineraryRepository {
  ShopIntineraryRepository._privateConstructor();

  static final ShopIntineraryRepository _instance =
  ShopIntineraryRepository._privateConstructor();

  static ShopIntineraryRepository get instance => _instance;

  final SaryaAPI _saryaAPI = SaryaAPI();

  Future<dynamic> getAllItinerary() async{
    try{
      var result  =  await _saryaAPI.getAllItinerary();
      return result;

    }catch(e){
      return e;
    }
  }

  Future<dynamic> getItineraryByStatus({required bool status}) async{
    try{
      var result  =  await _saryaAPI.getItineraryByStatus(status: status);
      print("getItineraryByStatus .............${result.toString()}");

      return result;

    }catch(e){
      return e;
    }
  }

  Future<dynamic> getPublicItinerary() async{
    try{
       var result  = await _saryaAPI.getPublicItinerary();
       print("getPublicItinerary .............$result");
       return result;
    }catch(e){
      return e;
    }
  }

  Future<dynamic> getSearchItinerary({required String searchedKeyword}) async{
    try{
      var result  =   await _saryaAPI.getSearchItinerary(searchedKeyword: searchedKeyword);
      print("getSearchItinerary .............$result");

      return result;

    }catch(e){
      return e;
    }
  }

  Future<dynamic> getCreatedItineraryByID({required String id}) async{
    try{
      print("getItineraryByID .............${id}");

      var result  =  await _saryaAPI.getCreatedItineraryByID(id: id);
      log("getItineraryByID .............${result.toString()}");

      return result;

    }catch(e){
      return e;
    }
  }

  Future<dynamic> getPublicItineraryByID({required String id}) async{
    try{
      print("getItineraryByID .............${id}");

      var result  =  await _saryaAPI.getPublicItineraryByID(id: id);
      log("getItineraryByID .............${result.toString()}");

      return result;

    }catch(e){
      return e;
    }
  }

  Future<dynamic> getPurchaseItineraryByID({required String id}) async{
    try{
      print("getItineraryByID .............${id}");

      var result  =  await _saryaAPI.getPurchaseItineraryByID(id: id);
      log("getItineraryByID .............${result.toString()}");

      return result;

    }catch(e){
      return e;
    }
  }




}