import requests
import coremltools


def downloadOxford102Model():
    print('Begin download oxford102.caffemodel...')

    url = 'https://s3.amazonaws.com/jgoode/oxford102.caffemodel'
    r = requests.get(url)

    with open('oxford102.caffemodel', 'wb') as f:
        f.write(r.content)

    convertCaffe2CoreML()


def convertCaffe2CoreML():
    caffe_model = ('oxford102.caffemodel', 'deploy.prototxt')
    labels = 'flower-labels.txt'

    coreml_model = coreml_model = coremltools.converters.caffe.convert(
        caffe_model,
        class_labels = labels,
        image_input_names = 'data')
    coreml_model.save('FlowerClassifier.mlmodel')

if __name__ == '__main__':
    downloadOxford102Model()
