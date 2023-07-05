import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolebased/timer_provider.dart';
// import 'package:provider_timer/provider/timer_provider.dart';

class timerScreen extends StatefulWidget {
  final bool isOwner;
  const timerScreen({super.key, required this.isOwner});
  @override
  _timerScreenState createState() => _timerScreenState();
}

class _timerScreenState extends State<timerScreen> {
  var timer;
  var Extratimer;

  // int? sec, min, hr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Provider.of<TimerProvider>(context, listen: false);
    // Extratimer = Provider.of<ExtraTimerProvider>(context, listen: false);
    // timer.setVars(hr: 0, min: 30, sec: 0);

    // print(context.watch<TimerProvider>().minute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: homeScreenBody(widget.isOwner),
    );
  }

  Widget homeScreenBody(bool isOwner) {
    late TextEditingController sec = TextEditingController();
    late TextEditingController min = TextEditingController();
    late TextEditingController hr = TextEditingController();

    // int hour = 0;
    // int minute = 30;
    // int seconds = 0;

    // setTimer(int hr, int min, int sec) {
    //   hour = hr;
    //   minute = min;
    //   seconds = sec;
    //   timer.setVars(hr, min, sec);
    // }

    return Column(
      children: [
        Container(child: Consumer<TimerProvider>(
          builder: (context, timeprovider, widget) {
            return Column(
              children: [
                SizedBox(
                  height: 65,
                ),

                isOwner
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                color: Colors.grey.shade300,
                                child: Center(
                                  child: TextField(
                                    controller: hr,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        hintStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey.shade600),
                                        hintText: "hr"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.grey.shade300,
                                  child: Center(
                                    child: TextField(
                                      controller: min,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          hintStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey.shade600),
                                          hintText: "min"),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                color: Colors.grey.shade300,
                                child: Center(
                                  child: TextField(
                                    controller: sec,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        hintStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey.shade600),
                                        hintText: "sec"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                timer.setVars(
                                    hr: int.parse(hr.text),
                                    min: int.parse(min.text),
                                    sec: int.parse(sec.text));
                              },
                              child: Text('set timer')),
                        ],
                      ))
                    : SizedBox(),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    '${timer.hour} : ' +
                        '${timer.minute} : ' +
                        '${timer.seconds} ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                ),
                // timer.minute == 0 ? Extratimer.startTimer : null,
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (timer.startEnable)
                        ? ElevatedButton(
                            onPressed: () {
                              timer.startTimer(int.parse(hr.text),
                                  int.parse(min.text), int.parse(sec.text));
                            },
                            child: Text('Start'),
                          )
                        : (timer.stopEnable)
                            ? ElevatedButton(
                                onPressed: timer.stopTimer,
                                child: Text('stop'),
                              )
                            : ElevatedButton(
                                onPressed: timer.continueTimer,
                                child: Text('continue'),
                              ),

                    // (timer.stopEnable)
                    //     ? ElevatedButton(
                    //         onPressed: timer.stopTimer,
                    //         child: Text('Stop'),
                    //       )
                    //     : ElevatedButton(
                    //         onPressed: null,
                    //         child: Text('start'),
                    //       ),
                    // (timer.continueEnable)
                    //     ? ElevatedButton(
                    //         onPressed: timer.continueTimer,
                    //         child: Text('Continue'),
                    //       )
                    //     : ElevatedButton(
                    //         onPressed: null,
                    //         child: Text('Continue'),
                    //       ),
                  ],
                ),
              ],
            );
          },
        )),
        Container(child: Consumer<TimerProvider>(
          builder: (context, timeprovider, widget) {
            return Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    '${timer.Extrahour} : ' +
                        '${timer.Extraminute} : ' +
                        '${timer.Extraseconds} ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => DemoPage(),
                //       ));
                //     },
                //     child: Text('next page'))
              ],
            );
          },
        ))
      ],
    );
  }
}
