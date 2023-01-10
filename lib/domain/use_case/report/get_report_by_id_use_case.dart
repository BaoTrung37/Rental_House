import 'package:batru_house_rental/data/repositories/report/report_repository.dart';
import 'package:batru_house_rental/domain/entities/report/report_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetReportByIdUseCase extends FutureUseCase<String, ReportEntity> {
  @override
  Future<ReportEntity> run(String input) async{
    return injector.get<ReportRepository>().getReportById(input);
  }
}
