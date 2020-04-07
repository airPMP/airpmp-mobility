import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'simple_blocs_event.dart';
part 'simple_blocs_state.dart';

class SimpleBlocsBloc extends Bloc<SimpleBlocsEvent, SimpleBlocsState> {
  @override
  SimpleBlocsState get initialState => Rebuild();

  @override
  Stream<SimpleBlocsState> mapEventToState(
    SimpleBlocsEvent event,
  ) async* {
    if (event is RebuildDropDownIcon) {
      yield Rebuild();
    }
  }
}
