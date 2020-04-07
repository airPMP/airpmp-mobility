import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:job_card/models/job_card_models.dart';
import 'package:job_card/utilities/functions.dart';
import 'package:meta/meta.dart';

part 'job_card_event.dart';
part 'job_card_state.dart';

class JobCardHeaderBloc extends Bloc<JobCardHeaderEvent, JobCardHeaderState> {
  @override
  JobCardHeaderState get initialState =>
      BuildHeaderByDate(day: DateTime.now().day);

  @override
  Stream<JobCardHeaderState> mapEventToState(
    JobCardHeaderEvent event,
  ) async* {
    if (event is GetInProgressByDateHeader) {
      yield BuildHeaderByDate(day: event.date);
    } else if (event is GetInProgressByMonthHeader) {
      yield BuildHeaderByMonth(month: event.month);
    } else if (event is GetInProgressByWeekHeader) {
      yield BuildHeaderByWeek(week: event.week);
    } else if (event is GetInProgressByYearHeader) {
      yield BuildHeaderByYear(year: event.year);
    } else if (event is GetInProgressByAllHeader) {
      yield BuildHeaderByAll();
    }
  }
}

class JobCardBodyBloc extends Bloc<JobCardBodyEvent, JobCardBodyState> {
  @override
  JobCardBodyState get initialState => BuildBodyLoading();

  @override
  Stream<JobCardBodyState> mapEventToState(
    JobCardBodyEvent event,
  ) async* {
    if (event is GetInProgressBody) {
      if (event.type == "by_date") {
        yield BuildBodyLoading();
        List<MyJobCard> jobCards = await funToFilterByDate(event.filterNumber);
        yield BuildBodyLoaded(jobCards: jobCards);
      } else if (event.type == "by_month") {
        yield BuildBodyLoading();
        List<MyJobCard> jobCards = await funToFilterByMonth(event.filterNumber);
        yield BuildBodyLoaded(jobCards: jobCards);
      } else if (event.type == "by_week") {
        yield BuildBodyLoading();
        List<MyJobCard> jobCards = await funToFilterByWeek(event.filterNumber);
        yield BuildBodyLoaded(jobCards: jobCards);
      } else if (event.type == "by_year") {
        yield BuildBodyLoading();
        List<MyJobCard> jobCards = await funToFilterByYear(event.filterNumber);
        yield BuildBodyLoaded(jobCards: jobCards);
      }
    }
  }
}



funToFilterByDate(int day) async {
  return getInProgressJobCard(await getSavedToken());
}

funToFilterByMonth(int month) {}
funToFilterByWeek(int week) {}
funToFilterByYear(int year) {}
