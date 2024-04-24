import 'package:equatable/equatable.dart';
import '../models/ticket_details_model.dart';
import '/core/app_export.dart';
import '../models/ticket_details_item_model.dart';
part 'ticket_details_event.dart';
part 'ticket_details_state.dart';

class TicketDetailsBloc extends Bloc<TicketDetailsEvent, TicketDetailsState> {
  TicketDetailsBloc(TicketDetailsState initialState) : super(initialState) {
    on<TicketDetailsInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<TicketDetailsState> emit,
  ) {
    emit(state.copyWith(selected: event.value));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<TicketDetailsState> emit,
  ) {
    emit(state.copyWith(notavailable: event.value));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<TicketDetailsState> emit,
  ) {
    emit(state.copyWith(vip: event.value));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<TicketDetailsState> emit,
  ) {
    emit(state.copyWith(regularFifty: event.value));
  }

  List<TicketDetailsItemModel> fillSevenItemList() {
    return [
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(
          contrast: ImageConstant.imgCloseSecondarycontainer),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgContrast),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose),
      TicketDetailsItemModel(contrast: ImageConstant.imgClose)
    ];
  }

  _onInitialize(
    TicketDetailsInitialEvent event,
    Emitter<TicketDetailsState> emit,
  ) async {
    emit(state.copyWith(
        selected: false, notavailable: false, vip: false, regularFifty: false));
    emit(
      state.copyWith(
        ticketDetailsModelObj: state.ticketDetailsModelObj?.copyWith(
          ticketDetailsItemList: fillSevenItemList(),
        ),
      ),
    );
  }
}
