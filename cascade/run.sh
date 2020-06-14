#opencv_traincascade -data lbp -vec positives.vec -bg bg.txt -numStages 5 -minHitRate 0.999 -maxFalseAlarmRate 0.5 -numPos 1000 -numNeg 2500 -w 64 -h 64 -mode ALL -precalcValBufSize 4096 -precalcIdxBufSize 4096 -featureType LBP
opencv_traincascade -data data -vec positives.vec -bg bg.txt -minHitRate 0.999 -numPos 13500 -numNeg 3000 -numStages 9 -w 25 -h 25
