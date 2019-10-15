import Foundation

var width : Float = 1.5
var height : Float = 2.3

var bucketOfPaint : Int {
    
    get {
        
        let areaCoverPerBucket : Float = 1.5
        let area = width * height
        let numberOfBucket = ceil(area / areaCoverPerBucket)
        return Int(numberOfBucket)
    }
    set {
        
        let areaCoverPerBucket : Float = 1.5
        let areaCanCover = Float(newValue) * areaCoverPerBucket
        print("This amount of paint can cover ana area of \(areaCanCover)")
    }
}

bucketOfPaint = 12

print(bucketOfPaint)
