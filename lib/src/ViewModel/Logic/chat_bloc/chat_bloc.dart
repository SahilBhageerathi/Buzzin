import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  static ChatBloc? _instance;

  static ChatBloc get instance{
    _instance ??= ChatBloc._();
    return _instance!;
  }

  ChatBloc._() : super(ChatState()) {
    on<ChatEvent>((event, emit) {

    });
  }
}
