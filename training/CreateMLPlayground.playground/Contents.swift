import Cocoa
import CreateML


func createSentimentClassifier() throws {
    
    if #available(OSX 10.14, *) {
        
        guard let trainingDataPath = Bundle.main.url(forResource: "data", withExtension: "json") else {
            return
        }
        
        let dataTable = try MLDataTable(contentsOf: trainingDataPath)
        
        let (trainingData, testingData) = dataTable.randomSplit(by: 0.8, seed: 5)
        
        let sentimentClassifier = try MLTextClassifier(trainingData: trainingData,
                                                       textColumn: "text",
                                                       labelColumn: "rating")
        
        // Training accuracy as a percentage
        let trainingAccuracy = (1.0 - sentimentClassifier.trainingMetrics.classificationError) * 100
        
        // Validation accuracy as a percentage
        let validationAccuracy = (1.0 - sentimentClassifier.validationMetrics.classificationError) * 100
        
        debugPrint("TrainingAccuracy \(trainingAccuracy)")
        debugPrint("ValidationAccuracy \(validationAccuracy)")
        
        // Evaluate the classifier's accuracy
        let evaluationMetrics = sentimentClassifier.evaluation(on: testingData)
        let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100
        
        debugPrint("EvaluationAccuracy \(evaluationAccuracy)")
        
        // Save the model to CoreML
        
        let metadata = MLModelMetadata(author: "Rodrigo Morbach",
                                       shortDescription: "A model trained to classify stadium's quality",
                                       version: "1.0")
        
        let path = "{YOUR_PATH_HERE}/Stadium.mlmodel"
        
        try sentimentClassifier.write(to: URL(fileURLWithPath: path),
                                      metadata: metadata)
        
        
        
    } else {
        debugPrint("OSX < 10.14")
    }
}

do {
    try createSentimentClassifier()
} catch {
    debugPrint("exception \(error.localizedDescription)")
}

