# Text Classifier sample using CreateML

This is a sample project intended to practice the usage of [CreateML](https://developer.apple.com/documentation/createml/).

Training data is a collection of Google reviews of soccer stadiums of Brazil. 

This sample is composed of:

* a [training playground](training/): a sample of how to create a sentiment classifier using `MLTextClassifier`.
* a [sample application](app/): iOS app that makes use of generated CoreML model.


## Requirements

* macOS 10.14 or later;

## Required changes

If you want to retrain the model with your own data, replace `data.json` file inside the playground resources folder, and remember to change this code snippet:
```swift
 let path = "{YOUR_PATH_HERE}/Stadium.mlmodel"
```



