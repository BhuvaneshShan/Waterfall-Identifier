# WATERFALL IDENTIFIER
Identifies waterfall in a given image

Similar to face detection on photographs, this project finds the location of waterfall in a picture.
I tried a crude implementation of detection of Haar-like features in an image. 

Created using Processing (https://processing.org/) over a weekend.
Wrote it from scratch without using any external library! :)

IntImg.pde is the source code file. 

The following snapshots show the result for different waterfall pictures. 

##Successfull identification

![My image](https://thebluebreeze.files.wordpress.com/2015/02/capture1.png)
![My image](https://thebluebreeze.files.wordpress.com/2015/02/capture3.png)
![My image](https://thebluebreeze.files.wordpress.com/2015/02/capture5.png)
![My image](https://thebluebreeze.files.wordpress.com/2015/02/capture4.png)
![My image](https://thebluebreeze.files.wordpress.com/2015/02/capture9.png)

Since the identification starts with standard window sizes, the images that have waterfall prominently with darker surrounding regions, were identifed on the first go. 
So, the windows sizes look the same in some of the above images.

##Partial identification

![My image](https://thebluebreeze.files.wordpress.com/2015/02/capture7.png)
![My image](https://thebluebreeze.files.wordpress.com/2015/02/capture2.png)
![My image](https://thebluebreeze.files.wordpress.com/2015/02/capture6.png)

##Identification with additional non-waterfall areas

![My image](https://thebluebreeze.files.wordpress.com/2015/02/capture8.png)
![My image](https://thebluebreeze.files.wordpress.com/2015/02/capture91.png)
![My image](https://thebluebreeze.files.wordpress.com/2015/02/capture92.png)



