// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TicketsController on _TicketsControllerBase, Store {
  Computed<int>? _$pendingTicketsComputed;

  @override
  int get pendingTickets =>
      (_$pendingTicketsComputed ??= Computed<int>(() => super.pendingTickets,
              name: '_TicketsControllerBase.pendingTickets'))
          .value;

  final _$ticketsAtom = Atom(name: '_TicketsControllerBase.tickets');

  @override
  List<Ticket>? get tickets {
    _$ticketsAtom.reportRead();
    return super.tickets;
  }

  @override
  set tickets(List<Ticket>? value) {
    _$ticketsAtom.reportWrite(value, super.tickets, () {
      super.tickets = value;
    });
  }

  final _$getTicketsAsyncAction =
      AsyncAction('_TicketsControllerBase.getTickets');

  @override
  Future<void> getTickets() {
    return _$getTicketsAsyncAction.run(() => super.getTickets());
  }

  @override
  String toString() {
    return '''
tickets: ${tickets},
pendingTickets: ${pendingTickets}
    ''';
  }
}
