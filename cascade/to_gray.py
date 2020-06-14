# pylint: disable-all

import cv2
import glob
import sys
import os

def rgb2gray(src, dest, is_neg=False):
  files = glob.glob('{0}/*'.format(src))
  for file in files:
    delim = "/"
    if sys.platform=="win32":
      delim = "\\"
    name = file.split(delim)[-1]
    if os.path.isfile(dest+delim+name):
        continue
    #print(name, file)
    I = cv2.imread(file, cv2.IMREAD_GRAYSCALE)
    J = cv2.resize(I, (400, 400)) if is_neg else I
    cv2.imwrite(dest+delim+name, J)



rgb2gray("./pos_orig", "./pos")
rgb2gray("./neg_orig", "./neg", True)
