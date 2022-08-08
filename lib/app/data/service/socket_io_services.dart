import 'package:dump/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class SocketIoService extends GetxService{



  late IO.Socket socket;

  @override
  void onInit() {
    IO.Socket socket = IO.io('http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .build());
    socket.connect();
    Utility.printDLog('${socket.connected}');
    Utility.printDLog('${socket.id}');
    super.onInit();
  }

  @override
  void onClose() {
    socket.close();
    super.onClose();
  }





// Socket? socket;
  //
  // void initializeSocket() async{
  //   Utility.printDLog('Making connection to socket.io in server');
  //   socket = io("http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com:4000",  OptionBuilder()
  //       .setTransports(['websocket'])
  //       .disableAutoConnect()
  //       // .setExtraHeaders({'foo': 'bar'}) // optional
  //       .build()
  //   );
  //   socket!.connect();
  //
  //   socket!.on('connection', (data) {
  //     Utility.printDLog('${socket!.connected}');
  //   });
  //
  //   socket!.on('disconnect', (data) {
  //     Utility.printDLog('disconnect');
  //   });
  // }
  //
  // void emitIdentityEvents(String id)async {
  //   Utility.printDLog('Emit identity events');
  //   socket!.emit('identity',{
  //     'userId':id
  //   });
  // }
  //
  // void emitSubscribeEvents(String userId, String roomId)async {
  //   Utility.printDLog('Emit subscribe events');
  //   socket!.emit('subscribe',{
  //     'userId':userId,
  //     'room':roomId
  //   });
  // }
  //
  // void emitUnSubscribeEvents(String roomId)async {
  //   Utility.printDLog('Emit unsubscribe events');
  //   socket!.emit('unsubscribe',{
  //     'room':roomId
  //   });
  // }

}