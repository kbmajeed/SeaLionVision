#import shutil, os, sys

#dest = 'D:\\Desky\\PhD KFUPM\\ICS 615 Advanced Computer Vision Sabri Mahmoud\\Term Project\\AllPatches';
#src  = ''
#
#shutil.copytree(src, dest) 
#

i=1


#cards = 
a = "xcopy "
b = "D:\Desky\PhD KFUPM\ICS 615 Advanced Computer Vision Sabri Mahmoud\Term Project\Patches_"
c = "D:\Desky\PhD KFUPM\ICS 615 Advanced Computer Vision Sabri Mahmoud\Term Project\AllPatches"
d = " /s /y"
e = a + b + c + d
f = a +""" " """+ b + str(i) + """ " """+ c + d
               
#cardspath = "D:\Desky\PhD KFUPM\ICS 615 Advanced Computer Vision Sabri Mahmoud\Term Project\Patches_"
for i in range(700):
    f = a +""" " """+ b + str(i) + """ " """+ c + d
    print(f)