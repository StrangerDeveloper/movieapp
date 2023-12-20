import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/ticket_tab_container_model.dart';
part 'ticket_tab_container_event.dart';
part 'ticket_tab_container_state.dart';

/// A bloc that manages the state of a TicketTabContainer according to the event that is dispatched to it.
class TicketTabContainerBloc
    extends Bloc<TicketTabContainerEvent, TicketTabContainerState> {
  TicketTabContainerBloc(TicketTabContainerState initialState) : super(initialState) {
    on<TicketTabContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TicketTabContainerInitialEvent event,
    Emitter<TicketTabContainerState> emit,
  ) async {}
}
