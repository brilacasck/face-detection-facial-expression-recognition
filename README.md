# Face Recognition Using Cascade Detectors & Facial Expression Classification Using CNN

## Notes

- The datasets are not pushed to the repo!
- The result data (cascade xml file and cnn models) are not pushed to the repo!

## Stages

1. Gathering Dataset 
2. Train Cascade Classifier 
3. Train CNN 
4. Merge Face Detection and Facial Expression Recognition

----
----
----

### Gathering Dataset

We need 2 datasets for our project:

1. Dataset for Cascade Classifier
2. Dateset for CNN

The first dataset is used to detect face among other objects. \
So the **faces** are the **positive** data and **other objects** could be the **negative**.

The second dataset is used for CNN feed. After the CNN training, the trained model can recognize five different emotions. Therefore, we seperate the second dataset to the following expressions. \

- neutral
- happy
- sad
- surprised
- angry

You can train the cascade classifier and the CNN with any type of data!

----

### Train Cascade Classifier

You can find relevant code in ***cascade*** folder of the repository.

To be honest, this part of job was a little tricky and boring. \
To use the haar or lbp `opencv_traincascade`, first you should:

1. Get opencv and opencv_contrib command collections
2. Run the command via cli rather than python program

So we had decided to write some *bash scripts* to make the process easier. \
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
The concept is that you have some negative and positive images in two different folders, about 1000 images in each. However, you need to generate more images with different aspects (angles, perspectives, ...). \
So what we've done, is creating *information data file* of original images. \
Afterward, we generate more than 10000 of images with different perspective and angles from a single image.  \
Then, we tried to make another *information data file* for these new images. \
Finally we merged all the information files to pass through the `opencv_traincascade`.

If you are messed up till now, I suggest you to read following tutorials:

- https://docs.opencv.org/master/dc/d88/tutorial_traincascade.html
- https://www.learnopencv.com/training-better-haar-lbp-cascade-eye-detector-opencv/

----

After training the cascade classifier, -whether with HAAR or LBP algorithms- an XML file will be generated which is needed for the final  step:

> Facial Expression Classification

### Train CNN Data

You can find the code in ***cnn*** folder of the repository.

The related information about the CNN model will be added soon.

We've used **Keras** to train and predict.

----

### Merge

This stage is to use the cascade.xml and the CNN trained model to detect the face position and the facial expression respectively. 

**No complexity** >> We didn't push the merged codes

----

## Results (By Kamran Akbar)

![results-kamran-akbar](results-kamran-akbar.gif)

----

## Authors:

- Alireza Kavian
- Kamran Akbar
