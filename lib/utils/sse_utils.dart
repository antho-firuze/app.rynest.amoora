import 'dart:async';
import 'dart:typed_data';

import 'package:async/async.dart';

class SseTransformer extends StreamTransformerBase<String, SseMessage> {
  const SseTransformer();

  @override
  Stream<SseMessage> bind(Stream<String> stream) {
    return Stream.eventTransformed(stream, (sink) => SseEventSink(sink));
  }
}

class SseEventSink extends EventSinkBase<String> {
  final EventSink<SseMessage> _eventSink;
  SseEventSink(this._eventSink);

  String? _id;
  String _event = "message";
  String _data = "";
  int? _retry;

  @override
  void onAdd(data) {
    if (data.startsWith("id:")) {
      _id = data.substring(3);
      return;
    }
    if (data.startsWith("event:")) {
      _event = data.substring(6);
      return;
    }
    if (data.startsWith("data:")) {
      _data = data.substring(5);
      return;
    }
    if (data.startsWith("retry:")) {
      _retry = int.tryParse(data.substring(6));
      return;
    }
    if (data.isEmpty) {
      _eventSink.add(SseMessage(id: _id, event: _event, data: _data, retry: _retry));
      _id = null;
      _event = "message";
      _data = "";
      _retry = null;
    }
  }

  @override
  FutureOr<void> onClose() {
    _eventSink.close();
  }

  @override
  void onError(Object error, [StackTrace? stackTrace]) {
    _eventSink.addError(error, stackTrace);
  }
}

class SseMessage {
  final String? id;
  final String event;
  final String data;
  final int? retry;

  const SseMessage({
    this.id,
    required this.event,
    required this.data,
    this.retry,
  });
}

StreamTransformer<Uint8List, List<int>> uInt8Transformer = StreamTransformer.fromHandlers(
  handleData: (data, sink) {
    sink.add(List<int>.from(data));
  },
);
