import 'package:flutter/material.dart';

class TeleponScreen extends StatefulWidget {
  final String driverName;
  final String driverImage; // Path atau URL gambar driver

  const TeleponScreen({
    super.key,
    required this.driverName,
    this.driverImage = "assets/images/driver-motor-image.jpg",
  });

  @override
  State<TeleponScreen> createState() => _TeleponScreenState();
}

class _TeleponScreenState extends State<TeleponScreen> {
  bool isSpeakerOn = false;
  bool isMuted = false;

  void _toggleSpeaker() {
    setState(() {
      isSpeakerOn = !isSpeakerOn;
    });
  }

  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
  }

  void _endCall() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(255, 73, 112, 118),
              Color.fromARGB(255, 58, 98, 110),
              Color.fromARGB(255, 44, 83, 103),
              Color.fromARGB(255, 34, 69, 97),
              Color.fromARGB(255, 27, 54, 91),
              Color.fromARGB(255, 26, 38, 86),
            ], // Gradient : https://www.learnui.design/tools/gradient-generator.html?c0=6C8C86&c1=1A2656&type=0&int=lchuv&dir=short&ang=135
            tileMode: TileMode.mirror,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Driver Info Section
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.driverImage),
                      radius: 60,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.driverName,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "00:15", // Contoh durasi panggilan
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ],
                ),

                // Call Controls Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Mute Button
                    _buildIconButton(
                      icon: isMuted ? Icons.mic_off : Icons.mic,
                      label: isMuted ? "Unmute" : "Mute",
                      color: isMuted ? Colors.red : Colors.white,
                      onPressed: _toggleMute,
                    ),
                    const SizedBox(width: 40),
                    // Speaker Button
                    _buildIconButton(
                      icon: isSpeakerOn ? Icons.volume_up : Icons.phone_android,
                      label: isSpeakerOn ? "Speaker" : "Phone",
                      color: isSpeakerOn ? Colors.black : Colors.white,
                      onPressed: _toggleSpeaker,
                    ),
                  ],
                ),

                // End Call Button
                FloatingActionButton(
                  onPressed: _endCall,
                  backgroundColor: Colors.red,
                  child: const Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: color, size: 40),
          onPressed: onPressed,
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: color)),
      ],
    );
  }
}
