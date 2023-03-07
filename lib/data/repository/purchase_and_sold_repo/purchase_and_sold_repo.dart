import 'package:sarya/data/provider/sarya_api.dart';

class PurchaseSoldItineraryRepository {
  PurchaseSoldItineraryRepository._privateConstructor();

  static final PurchaseSoldItineraryRepository _instance =
  PurchaseSoldItineraryRepository._privateConstructor();

  static PurchaseSoldItineraryRepository get instance => _instance;

  final SaryaAPI _saryaAPI = SaryaAPI();

  Future<dynamic> getAllPurchase() async{
    try {
      var result  = await _saryaAPI.getAllPurchasedItinerary();
      print("getAllPurchase.............${result.toString()}");
      return result;
    }catch(e){
      rethrow;
    }

  }

  Future<dynamic> purchaseItinerary({required body}) async{
    try {
      var result  = await _saryaAPI.purchasedItinerary(body: body);
      return result;

    }catch(e){
      rethrow;
    }

  }

  Future<dynamic> getPurchaseItineraryDetail({required String id}) async{
    try {
      var result  = await _saryaAPI.getPurchasedItineraryDetail(id: id);
      return result;
    }catch(e){
      rethrow;
    }

  }

  Future<dynamic> getAllSoldItinerary() async{
    try {
      var result  = await _saryaAPI.getAllSoldItinerary();
      return result;

    }catch(e){
      rethrow;
    }

  }

  Future<dynamic> getSoldItineraryDetail({required String id}) async{
    try {
      print("getSoldItineraryDetail.....id........$id");

      var result  = await _saryaAPI.getSoldItineraryDetail(id: id);
      print("getSoldItineraryDetail.............$result");
      return result;
    }catch(e){
      rethrow;
    }

  }

}