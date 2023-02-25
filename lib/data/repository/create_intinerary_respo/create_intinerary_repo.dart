import 'dart:developer';
import '../../../create_intinerary/model/activity_type_response.dart';
import '../../../create_intinerary/model/checklist_response.dart';
import '../../../create_intinerary/model/create_intinerary_response.dart';
import '../../../create_intinerary/model/transport_response.dart';
import '../../../create_intinerary/model/trip_response.dart';
import '../../provider/sarya_api.dart';

class CreateIntineraryRepository {
  CreateIntineraryRepository._privateConstructor();

  static final CreateIntineraryRepository _instance =
      CreateIntineraryRepository._privateConstructor();

  static CreateIntineraryRepository get instance => _instance;

  final SaryaAPI _saryaAPI = SaryaAPI();

  Future<CreateIntineraryResponse> createIntinerary({var body}) async {
    try {
      log('body......$body',
          name: ' createIntinerary | CreateIntineraryRepository');
      var data = await _saryaAPI.createIntinerary(body: body);
      log('data......$data',
          name: ' createIntinerary | CreateIntineraryRepository');
      return CreateIntineraryResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CreateIntineraryResponse> updateIntinerary({required body, required String id}) async {
    try {
      log('body......$body',
          name: ' createIntinerary | CreateIntineraryRepository');
      var data = await _saryaAPI.updateIntinerary(body: body, intineraryID: id);
      log('data......$data',
          name: ' createIntinerary | CreateIntineraryRepository');
      return CreateIntineraryResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ActivityTypeResponse> activity() async {
    try {
      var data = await _saryaAPI.getActivity();
      log('data......$data',
          name: ' createIntinerary | CreateIntineraryRepository');
      return ActivityTypeResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<TransportResponse> transport() async {
    try {
      var data = await _saryaAPI.getTransport();
      log('data......$data',
          name: ' createIntinerary | CreateIntineraryRepository');
      return TransportResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<TripResponse> trip() async {
    try {
      log('data......1',
          name: ' trip | CreateIntineraryRepository');
      var data = await _saryaAPI.getTrip();
      log('data.2.....$data',
          name: ' trip | CreateIntineraryRepository');
      return TripResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CheckListResponse> checkList() async {
    try {
      log('data......1', name: 'checkList | CreateIntineraryRepository');
      var data = await _saryaAPI.getCheckList();
      log('data.2.....$data', name: 'checkList | CreateIntineraryRepository');

      return CheckListResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }


}
