import 'package:equatable/equatable.dart';
import 'package:movieapp/presentation/Tickets/models/ticket_item_model.dart';
import 'package:movieapp/presentation/Tickets/models/ticket_model.dart';
import '/core/app_export.dart';
part 'ticket_event.dart';
part 'ticket_state.dart';

/// A bloc that manages the state of a Six according to the event that is dispatched to it.
class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc(TicketState initialState) : super(initialState) {
    on<SixInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SixInitialEvent event,
    Emitter<TicketState> emit,
  ) async {
    emit(state.copyWith(
        sixModelObj:
            state.ticketModel?.copyWith(ticketItemList: fillSixItemList())));
  }

  List<TicketItemModel> fillSixItemList() {
    return List.generate(2, (index) => TicketItemModel());
  }
}
