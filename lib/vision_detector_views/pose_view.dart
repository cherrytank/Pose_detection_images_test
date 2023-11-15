import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:path_provider/path_provider.dart';
import 'pose_transform.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
List<double?> posedata=[];
class pose_view extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<pose_view> {
  @override
  void initState(){
    global.pose_tranform();
    super.initState();
  }
  @override
  void dispose() async {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
            Positioned(
                //復健按鈕
                bottom: 15.0,
                child: Container(
                  height: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      padding: EdgeInsets.all(15),
                      backgroundColor: Color.fromARGB(250, 255, 190, 52),
                    ),
                    child: Text("Start!",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      process('/images/pose.jpeg');
                      //global.Det.startd();
                    },
                  ),
                ))
      ],
    );
  }

  Future<void> process(String path) async {
    File file = await getImageFileFromAssets(path);
    final InputImage inputImage = InputImage.fromFile(file);
    final options = PoseDetectorOptions();
    final poseDetector = PoseDetector(options: options);
    final List<Pose> poses = await poseDetector.processImage(inputImage);
    for (Pose pose in poses) {
      // to access all landmarks
      pose.landmarks.forEach((_, landmark) {
        final type = landmark.type;
        print(type);
        final x = landmark.x;
        print(x);
        final y = landmark.y;
        print(y);
      });
      // to access specific landmarks
      posedata=[
        pose.landmarks[PoseLandmarkType.nose]?.x,pose.landmarks[PoseLandmarkType.nose]?.y,//0,1
        pose.landmarks[PoseLandmarkType.leftEyeInner]?.x,pose.landmarks[PoseLandmarkType.leftEyeInner]?.y,//2,3
        pose.landmarks[PoseLandmarkType.leftEye]?.x,pose.landmarks[PoseLandmarkType.leftEye]?.y,//4,5
        pose.landmarks[PoseLandmarkType.leftEyeOuter]?.x,pose.landmarks[PoseLandmarkType.leftEyeOuter]?.y,//6,7
        pose.landmarks[PoseLandmarkType.rightEyeInner]?.x,pose.landmarks[PoseLandmarkType.rightEyeInner]?.y,//8,9
        pose.landmarks[PoseLandmarkType.rightEye]?.x,pose.landmarks[PoseLandmarkType.rightEye]?.y,//10,11
        pose.landmarks[PoseLandmarkType.rightEyeOuter]?.x,pose.landmarks[PoseLandmarkType.rightEyeOuter]?.y,//12,13
        pose.landmarks[PoseLandmarkType.leftEar]?.x,pose.landmarks[PoseLandmarkType.leftEar]?.y,//14,15
        pose.landmarks[PoseLandmarkType.rightEar]?.x,pose.landmarks[PoseLandmarkType.rightEar]?.y,//16,17
        pose.landmarks[PoseLandmarkType.leftMouth]?.x,pose.landmarks[PoseLandmarkType.leftMouth]?.y,//18,19
        pose.landmarks[PoseLandmarkType.rightMouth]?.x,pose.landmarks[PoseLandmarkType.rightMouth]?.y,//20,21
        pose.landmarks[PoseLandmarkType.leftShoulder]?.x,pose.landmarks[PoseLandmarkType.leftShoulder]?.y,//22,23
        pose.landmarks[PoseLandmarkType.rightShoulder]?.x,pose.landmarks[PoseLandmarkType.rightShoulder]?.y,//24,25
        pose.landmarks[PoseLandmarkType.leftElbow]?.x,pose.landmarks[PoseLandmarkType.leftElbow]?.y,//26,27
        pose.landmarks[PoseLandmarkType.rightElbow]?.x,pose.landmarks[PoseLandmarkType.rightElbow]?.y,//28,29
        pose.landmarks[PoseLandmarkType.leftWrist]?.x,pose.landmarks[PoseLandmarkType.leftWrist]?.y,//30,31
        pose.landmarks[PoseLandmarkType.rightWrist]?.x,pose.landmarks[PoseLandmarkType.rightWrist]?.y,//32,33
        pose.landmarks[PoseLandmarkType.leftPinky]?.x,pose.landmarks[PoseLandmarkType.leftPinky]?.y,//34,35
        pose.landmarks[PoseLandmarkType.rightPinky]?.x,pose.landmarks[PoseLandmarkType.rightPinky]?.y,//36,37
        pose.landmarks[PoseLandmarkType.leftIndex]?.x,pose.landmarks[PoseLandmarkType.leftIndex]?.y,//38,39
        pose.landmarks[PoseLandmarkType.rightIndex]?.x,pose.landmarks[PoseLandmarkType.rightIndex]?.y,//40,41
        pose.landmarks[PoseLandmarkType.leftThumb]?.x,pose.landmarks[PoseLandmarkType.leftThumb]?.y,//42,43
        pose.landmarks[PoseLandmarkType.rightThumb]?.x,pose.landmarks[PoseLandmarkType.rightThumb]?.y,//44,45
        pose.landmarks[PoseLandmarkType.leftHip]?.x,pose.landmarks[PoseLandmarkType.leftHip]?.y,//46,47
        pose.landmarks[PoseLandmarkType.rightHip]?.x,pose.landmarks[PoseLandmarkType.rightHip]?.y,//48,49
        pose.landmarks[PoseLandmarkType.leftKnee]?.x,pose.landmarks[PoseLandmarkType.leftKnee]?.y,//50,51
        pose.landmarks[PoseLandmarkType.rightKnee]?.x,pose.landmarks[PoseLandmarkType.rightKnee]?.y,//52,53
        pose.landmarks[PoseLandmarkType.leftAnkle]?.x,pose.landmarks[PoseLandmarkType.leftAnkle]?.y,//54,55
        pose.landmarks[PoseLandmarkType.rightAnkle]?.x,pose.landmarks[PoseLandmarkType.rightAnkle]?.y,//56,57
        pose.landmarks[PoseLandmarkType.leftHeel]?.x,pose.landmarks[PoseLandmarkType.leftHeel]?.y,//58,59
        pose.landmarks[PoseLandmarkType.rightHeel]?.x,pose.landmarks[PoseLandmarkType.rightHeel]?.y,//60,61
        pose.landmarks[PoseLandmarkType.leftFootIndex]?.x,pose.landmarks[PoseLandmarkType.leftFootIndex]?.y,//62,63
        pose.landmarks[PoseLandmarkType.rightFootIndex]?.x,pose.landmarks[PoseLandmarkType.rightFootIndex]?.y,//64,65
      ];
    }
    print(posedata[0]);
    print("load done");
    poseDetector.close();
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets$path');
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

}

