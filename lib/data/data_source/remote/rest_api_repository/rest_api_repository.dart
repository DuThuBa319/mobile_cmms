import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/cmms/equipment/equipment.dart';
import '../../../models/cmms/maintenance_response/cause.dart';
import '../../../models/cmms/maintenance_response/employee.dart';
import '../../../models/cmms/maintenance_response/maintenance_request.dart';
import '../../../models/cmms/maintenance_response/maintenance_response.dart';
import '../../../models/example/weather_model.dart';
import '../../../models/example_temp_humid/temperature_model.dart';
import '../../../models/mock_work_order/work_order_model.dart';

part 'rest_api_repository.g.dart';

@RestApi()
abstract class RestApiRepository {
  factory RestApiRepository(Dio dio, {String baseUrl}) = _RestApiRepository;

  @GET('forecast')
  Future<WeatherModel> getWeather(
    @Query('latitude') String latitude,
    @Query('longitude') String longtitude,
    @Query('daily') String daily,
    @Query('timezone') String timezone,
    @Query('start_date') String startDate,
    @Query('end_date') String endDate,
  );
  @GET('forecast')
  Future<TemperatureModel> getTemperatureHourly(
    @Query('latitude') String latitude,
    @Query('longitude') String longtitude,
    @Query('hourly') List<String> hourly,
    @Query('timezone') String timezone,
    @Query('start_date') String startDate,
    @Query('end_date') String endDate,
  );
}

@RestApi()
abstract class MockApiRepository {
  factory MockApiRepository(Dio dio, {String baseUrl}) = _MockApiRepository;

  @GET('cmms')
  Future<WorkOrderModel> getWorkOrder(@Query('key') String key);
  @POST('cmms')
  Future<WorkOrderModel> createWorkOrder(
    @Query('key') String key,
    @Query('__method') String method,
    @Body() WorkOrderModel newWorkOrder,
  );
}

@RestApi()
abstract class RestCmmsApiRepository {
  factory RestCmmsApiRepository(Dio dio, {String baseUrl}) =
      _RestCmmsApiRepository;

  @GET('MaintenanceResponses')
  Future<List<MaintenanceResponse>> getListMaintenanceResponses();
  @GET('MaintenanceResponses/{maintenanceResponseId}')
  Future<MaintenanceResponse> getMaintenanceResponse(
    @Path('maintenanceResponseId') String maintenanceResponseId,
  );
  @GET('Equipments')
  Future<List<Equipment>> getListEquipments();
  @GET('Persons')
  Future<List<Employee>> getListEmployees();
  @GET('Causes')
  Future<List<Cause>> getListCauses();
  @POST('MaintenanceRequests')
  Future<bool> createMaintenanceRequest(
    @Body() MaintenanceRequest maintenanceRequest,
  );
}
