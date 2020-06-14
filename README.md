# Face Recognition Using Cascade Detectors & Facial Expression Classification Using CNN

## Notes

- The datasets are not pushed to the repo!
- The result data (cascade xml file and cnn models) are not pushed to the repo!

## Stages

1. Data Mining
2. Run Opencv Cascade Detection Script
3. Obtain Cascade XML file
4. Train CNN Data
5. Merge Face Detection and Facial Expression Recognition

----
----
----

### Data Mining

We'll need 2 datasets for our purpose:

1. dataset for cascade classification
2. dateset for cnn classification

The first is used to detect faces among all other objects. \
So the **faces** are the **positive** data and **all other objects** could be the **negative** data.

The seconds will be used for our convolutional neural network feed. \
The dataset should be separated to these 6 expressions:

- neutral
- happy
- sad
- surprised
- disgusted
- angry

Well, better to say that we used these six expression list to classify the sentiment of a face.
You could use any dataset type that you are needed!

----

### Opencv Train Cascade

You can find relevant codes in ***cascade*** folder of repository.

To be honest, this part of job was a little tricky and boring. \
To use the haar or lbp `opencv_traincascade` you should:

1. Have opencv and opencv_contrib command collections
2. Run the command via cli rather than python program

So we had decided to write some *bash scripts* to make the process easier And it is about a year passed from that procedure and I don't really remember the exact steps. \
This is what I'd wrote as an *Instruction*:

1. fill out the folders: **"neg_orig"** and **"pos_orig"** with images
2. run `to_gray.python` program. It resizes and converts images to grayscale and puts them to **"pos"** and **"neg"** folders
3. run `create_bg.sh` and `create_info.sh` to create information files: **"bg.txt"** for negatives and **"info.dat"** for positives (information files init)
4. run `create_neg.sh` and `create_pos.sh` to create samples with some single images in **"single_neg"** and **"single_pos"** folders
5. run `merge_neg_samples.sh` and `merge_pos_samples.sh` to merge .lst files for the generated samples to the **"bg.txt"** and **"info.dat"** files
6. copy *"info/\*.jpg"* to **"pos"** folder and *bg/\*.jpg* to **"neg"** folder
7. run `create_samples.sh` to run opencv_createsamples command for generating .vec file
8. run `nohup ./train.sh &` to run the training in background

**AAAAH YEAH That is sort of complicated, You might say and yes it is.** \
The concept is that, you have some negative and positive images in two diffenrent folders. say 1000 images for example. but you need to generate more images with different aspects (angles, perspectives). \
So what we've done, is that after creating *information data file* of original images, \
We used some single images (e.g. 10 images) to generate more than 10000 images with different perspectives. \
Then again we tried to make another *information data file* for these new images. \
Finally we merged all the information files to pass to the `opencv_traincascade`.

If you are messed up till now, I suggest you to read these tutorials instead to understand the concept and running procedure:

- https://docs.opencv.org/master/dc/d88/tutorial_traincascade.html
- https://www.learnopencv.com/training-better-haar-lbp-cascade-eye-detector-opencv/

----

### Obtain Cascade.xml File

After training cascade detector, -whether with HAAR or LBP algorithms- an XML file will be generated and we'll need it for our next step:

> Facial Expression Classification

### Train CNN Data

You can find the codes in ***cnn*** folder of repository.

Well, it's an ordinary convolutional neural network, So It seems doesn't need to be explained more.

We've used **Keras** to train and predict.

----

### Merge

This stage is to use tha cascade.xml to find the face and use the cnn trained model to detect the facial expression.

**No complexity** >> We didn't push the merged codes

----

## Results (By Kamran Akbar)

![results-kamran-akbar](results-kamran-akbar.gif)

----

## Authors:

- Alireza Kavian
- Kamran Akbar
