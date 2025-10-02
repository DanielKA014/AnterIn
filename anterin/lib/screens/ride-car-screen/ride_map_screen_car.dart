import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../widgets/driver_info_widget.dart';

class RideMapScreenCar extends StatefulWidget {
  final String from;
  final String to;

  const RideMapScreenCar({super.key, required this.from, required this.to});

  @override
  State<RideMapScreenCar> createState() => _RideMapScreenCarState();
}

class _RideMapScreenCarState extends State<RideMapScreenCar> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  String? randomDriverName;
  bool _isDriverArrived = false;

  final List<String> _driverNames = [
    "Sean Malicious",
    "Sean Dangerous",
    "Sean Nutrious",
    "Sean Serious",
  ];

  @override
  void initState() {
    super.initState();
    _setRandomDriverName();
    _initializeVideoPlayers();
  }

  void _setRandomDriverName() {
    final rand = Random();
    randomDriverName = _driverNames[rand.nextInt(_driverNames.length)];
  }

  void _initializeVideoPlayers() {
    _controller1 =
        VideoPlayerController.asset('assets/videos/driver_to_user.mp4')
          ..initialize().then((_) {
            setState(() {});
            _controller1.play();
          });

    _controller1.addListener(() {
      if (_controller1.value.position >= _controller1.value.duration &&
          !_isDriverArrived) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Driver ${randomDriverName!} sudah tiba di lokasi!'),
          ),
        );
        setState(() {
          _isDriverArrived = true;
        });
        _controller2.play();
      }
    });

    _controller2 = VideoPlayerController.asset('assets/videos/user_to_destination.mp4')
      ..initialize().then((_) {
        setState(() {});
      },
    );

    _controller2.addListener(() {
      if (_controller2.value.position >= _controller2.value.duration) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Anda sudah sampai tujuan.')),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  Future<void> _requestCallPermission() async {
    final status = await Permission.phone.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Izin telepon diberikan.")));
    } else if (status.isDenied) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Izin telepon ditolak.")));
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Izin telepon ditolak permanen. Buka pengaturan."),
        ),
      );
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _videoPlayerWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: DriverInfoWidget(
              driverName: randomDriverName ?? "Mencari Driver...",
              from: widget.from,
              to: widget.to,
              onCall: () async {
                context.push(
                  '/telepon',
                  extra: {
                    'driverName': randomDriverName,
                  },
                );
              },
              onChat: () {
                context.push(
                  '/message',
                  extra: {'driverName': randomDriverName},
                );
              },
              isDelivery: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _videoPlayerWidget() {
    if (!_controller1.value.isInitialized ||
        !_controller2.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller1.value.size.width,
          height: _controller1.value.size.height,
          child: _isDriverArrived
              ? VideoPlayer(_controller2)
              : VideoPlayer(_controller1),
        ),
      ),
    );
  }
}
