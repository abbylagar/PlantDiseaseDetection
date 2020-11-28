import 'dart:typed_data';
import 'dart:async';
import 'dart:io';
import'package:image/image.dart' as img;
import 'package:tflite/tflite.dart';


class RecognizerTool{
  
  Future loadModel() {
    Tflite.close();

    return Tflite.loadModel(
      model: "assets/plantAI.tflite",
      labels: "assets/labels.txt",
    );
  }

  dispose() {
    Tflite.close();
  }


  
  Future recognize(File imagesample) async {

    //directory of the file

    


    img.Image image_temp = img.decodeImage(imagesample.readAsBytesSync());
    img.Image resized = img.copyResize(image_temp,width:224,height: 224);
    File resize_file = File(imagesample.path)..writeAsBytesSync(img.encodeJpg(resized));

//print(imag);
      var bytes = await _imageToByteListUint8(resize_file, 224,225);
//      final image1 = img.decodeImage(img.image)toImage(Constants.mnistImageSize, Constants.mnistImageSize);
//      var pngBytes = await image.toByteData(format: ImageByteFormat.png);

  //debug only    print(bytes);
  //debug only    print("predictions");
      return await _predict(bytes);
  }



  Future _predict(var bytes) async { 
 //   print("predict function bytes entered");
 //   print(bytes);
    var recognitions =  await Tflite.runModelOnBinary(binary: bytes,
    threshold: 0.5);
var _recognitions = recognitions;
//print("recognitiona \n");
//print(_recognitions.toString());
//print("\n final answer");
//print(_recognitions[0]['label']);
//print(_recognitions[0]['confidence']);

    return  _recognitions;
    
  }


  Uint8List _imageToByteListUint8(File _image, int inputSize,double std)  {
    var convertedBytes = Float32List(1*inputSize*inputSize*3);
    var buffer = Float32List.view(convertedBytes.buffer);


  var bytes = _image.readAsBytesSync();
   var decoder = img.findDecoderForData(bytes);
   img.Image image = decoder.decodeImage(bytes);

  //img.Image resize = img.copyResize(image, width:224,height: 224);  
  
    //final img = await pic.toImage(size, size);
  
    //final imgBytes = await img.toByteData();
    //final resultBytes = Float32List(size * size);
  
  //  print("i entered in this functon");
    int pixelIndex = 0;

    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
          var pixel = image.getPixel(j,i);
        //  print("pixel:");
        //  print(pixel);
         // print("red");
        //  print(img.getRed(pixel).toString());
       //   print("normalized");        
      //    print(((img.getRed(pixel))/255).toString());
          buffer[pixelIndex++] = (img.getRed(pixel))/std;
          buffer[pixelIndex++] = (img.getGreen(pixel))/std;
          buffer[pixelIndex++] = (img.getRed(pixel))/std;
          
      }
    }
    //print("float here");
    //print(buffer);
    //print(convertedBytes.buffer.asFloat32List());
    return convertedBytes.buffer.asUint8List();
// return convertedBytes.buffer.asFloat32List();
 
 }





}