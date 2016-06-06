# Lex Training R
Materials developed and used for various R training courses based on this book: https://goo.gl/Lia9cI

The documents were created using `RMarkdown` in `RStudio` as PDFs. Unfortunately, the `RMD` files that create lovely PDFs do not always create nice `html` files using the Github compilation. So for example, equations in the `html` files still have the latex code, maps are not produced, etc. 

**For these reasons** the original PDF files are included in a zip file for each of the courses. You can also download the RMD files from the repository above and create the PDFs yourself: you could right click on the links below, save the `.RMD` files, open them in RStudio and click on the `Knit PDF` icon.

## Spatial Analysis of (Remote Sensing) Accuracy with GW frameworks 
This will be delivered in Montpellier in July 2016 by Lex Comber and Paul Harris as one of the Spatial Accuracy 2016 Conference workshops. The workshop includes the following sessions:

0. [Overview](https://github.com/lexcomber/LexTrainingR/blob/master/overview.Rmd)
1. [Introduction](https://github.com/lexcomber/LexTrainingR/blob/master/Introduction.Rmd)
2. [GW framework](https://github.com/lexcomber/LexTrainingR/blob/master/GW_framework.Rmd)
3. [Mapping Spatial Accuracy](https://github.com/lexcomber/LexTrainingR/blob/master/Mapping_Spatial_Accuracy.Rmd)
4. [Putting it all Together](https://github.com/lexcomber/LexTrainingR/blob/master/Putting_it_all_together.Rmd)
5. Additional materials - TBC

At the momement these scripts generate spatially distributed measures of Overall, User and Producer accuracies in the manner of Comber *et al* 2012 and Comber 2013. 

Descriptions of how to generate geographically weighted estimate of the Kappa statistic $\hat{\kappa}$, also known as k-hat, will be included in the the *Mapping Spatial Aaccuacy* practical in due course.

The PDFs that include the maps and plots are in a zip file  [**here**](https://github.com/lexcomber/LexTrainingR/blob/master/Spatial_Analysis_Accuracy_PDFs.zip).

###References
Comber A, Fisher PF, Brunsdon C and Khmag A (2012). Spatial analysis of remote sensing image classification accuracy. *Remote Sensing of Environment*, 127: 237–246.

Comber AJ (2013). Geographically weighted methods for estimating local surfaces of overall, user and producer accuracies. *Remote Sensing Letters*, 4: 373-380.


## The Intermediate R course 
This was delivered in Leeds in May 2016 by Robin Lovelace and Lex Comber and included the following modules developed by Lex Comber:

1. [Objects, functions and concepts for efficient R programming](https://github.com/lexcomber/LexTrainingR/blob/master/Objects_Functions.Rmd)
2. [Spatial Data in R](https://github.com/lexcomber/LexTrainingR/blob/master/Spatial_Data_in_R.Rmd)
3. [Manipulating spatial objects in R](https://github.com/lexcomber/LexTrainingR/blob/master/Manipluating_Spatial_Objects.Rmd)
4. [Raster Analysis in R](https://github.com/lexcomber/LexTrainingR/blob/master/Raster_Analysis.Rmd)
5. [Point Pattern Analysis in R](https://github.com/lexcomber/LexTrainingR/blob/master/Point_Pattern.Rmd)

If you want the PDFs that include the maps and plots, then a zip file of the PDFs is [**here**](https://github.com/lexcomber/LexTrainingR/blob/master/The%20Intermediate%20R%20course%20PDFs.zip) *or* if you wanted to create the PDFs yourself, you could right click on the links above, save the `.RMD` files, open them in RStudio and click on the `Knit PDF` icon.

Robin Lovelace's materials can be found [here](https://github.com/Robinlovelace/Creating-maps-in-R/tree/master/course-info)

