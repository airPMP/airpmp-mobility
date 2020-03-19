import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'job_card_event.dart';
part 'job_card_state.dart';

class JobCardBloc extends Bloc<JobCardEvent, JobCardState> {
  @override
  JobCardState get initialState => JobCardInitial();

  @override
  Stream<JobCardState> mapEventToState(
    JobCardEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
