# Readme



# install `kyoboLT` package


```r
devtools::install_github("lovetoken/kyoboLT")
```

# example

## `Xday_returns()` function


```r
index <- matrix(rnorm(60,1000, 8^2), 20, 3)
data <- xts(round(index, 1), as.Date(16001:16020)) # xts package for time series data
names(data) <- paste("Fund", 1:3, sep="_")
data
```

```
##            Fund_1 Fund_2 Fund_3
## 2013-10-23  961.1 1031.6 1049.7
## 2013-10-24  983.4 1103.9  892.5
## 2013-10-25  990.7  965.2 1094.0
## 2013-10-26 1111.7 1079.7  925.3
## 2013-10-27  974.7 1015.6 1037.9
## 2013-10-28 1071.8 1061.2 1063.3
## 2013-10-29  981.5 1014.4 1011.4
## 2013-10-30 1096.3 1020.2  960.0
## 2013-10-31  980.3  944.0  883.7
## 2013-11-01 1008.9  911.4 1068.1
## 2013-11-02  906.8  940.6  966.2
## 2013-11-03  970.7 1043.8 1012.6
## 2013-11-04  971.2 1095.3 1013.4
## 2013-11-05  951.2  979.6 1108.8
## 2013-11-06  961.6 1018.2 1061.4
## 2013-11-07 1024.5 1079.9 1064.6
## 2013-11-08 1027.7 1036.9  935.6
## 2013-11-09 1036.9 1110.5 1070.7
## 2013-11-10 1025.6  980.0  953.5
## 2013-11-11  934.7  993.2 1027.1
```

```r
Xday_returns(data, Xday=3) # basic 3 day returns
```

```
##                  Fund_1       Fund_2       Fund_3
## 2013-10-23           NA           NA           NA
## 2013-10-24           NA           NA           NA
## 2013-10-25           NA           NA           NA
## 2013-10-26  0.156695453  0.046626599 -0.118510050
## 2013-10-27 -0.008846858 -0.079989129  0.162913165
## 2013-10-28  0.081861310  0.099461252 -0.028062157
## 2013-10-29 -0.117117927 -0.060479763  0.093050902
## 2013-10-30  0.124756335  0.004529342 -0.075055400
## 2013-10-31 -0.085370405 -0.110441010 -0.168908116
## 2013-11-01  0.027916454 -0.101537855  0.056060906
## 2013-11-02 -0.172854146 -0.078023917  0.006458333
## 2013-11-03 -0.009792921  0.105720339  0.145863981
## 2013-11-04 -0.037367430  0.201777485 -0.051212433
## 2013-11-05  0.048963388  0.041462896  0.147588491
## 2013-11-06 -0.009374678 -0.024525771  0.048192771
## 2013-11-07  0.054880560 -0.014060075  0.050522992
## 2013-11-08  0.080424727  0.058493263 -0.156204906
## 2013-11-09  0.078306988  0.090650167  0.008762012
## 2013-11-10  0.001073694 -0.092508566 -0.104358444
## 2013-11-11 -0.090493335 -0.042144855  0.097798204
```

```r
Xday_returns(data, Xday=3, log.returns = T) # calculation 3 day log returns
```

```
##                  Fund_1       Fund_2       Fund_3
## 2013-10-23           NA           NA           NA
## 2013-10-24           NA           NA           NA
## 2013-10-25           NA           NA           NA
## 2013-10-26  0.145567192  0.045572230 -0.126141679
## 2013-10-27 -0.008886224 -0.083369793  0.150928206
## 2013-10-28  0.078682993  0.094820289 -0.028463424
## 2013-10-29 -0.124563641 -0.062385920  0.088972779
## 2013-10-30  0.117566421  0.004519116 -0.078021436
## 2013-10-31 -0.089236110 -0.117029456 -0.185014920
## 2013-11-01  0.027533894 -0.107070705  0.054545859
## 2013-11-02 -0.189774234 -0.081235996  0.006437568
## 2013-11-03 -0.009841187  0.100497013  0.136158921
## 2013-11-04 -0.038083487  0.183801698 -0.052570355
## 2013-11-05  0.047802427  0.040626356  0.137662776
## 2013-11-06 -0.009418897 -0.024831538  0.047067511
## 2013-11-07  0.053427547 -0.014159854  0.049288128
## 2013-11-08  0.077354229  0.056846446 -0.169845594
## 2013-11-09  0.075392208  0.086774002  0.008723849
## 2013-11-10  0.001073118 -0.097071152 -0.110214996
## 2013-11-11 -0.094852952 -0.043058718  0.093306541
```

## `trim()` function


```r
trim("  Wow!  ", method="trailing")
```

```
## [1] "  Wow!"
```

```r
trim("  Wow!  ", method="leading")
```

```
## [1] "Wow!  "
```

```r
"  Wow!  " %>% trim %>% trim(method="leading")
```

```
## [1] "Wow!"
```

## `tm_plot` function


```r
tm_plot(data, c(2,5,10))
```

<!--html_preserve--><div id="htmlwidget-7896" style="width:672px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-7896">{"x":{"data":[{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,null,null,null,null,null,1016.04,1010.61,1009.34,1007.39,991.34,990.03,985.3,989.92,983.98,988.51,981.09],"text":["Index: 2013-10-23<br>moving_average_3: NA","Index: 2013-10-24<br>moving_average_3: NA","Index: 2013-10-25<br>moving_average_3: NA","Index: 2013-10-26<br>moving_average_3: NA","Index: 2013-10-27<br>moving_average_3: NA","Index: 2013-10-28<br>moving_average_3: NA","Index: 2013-10-29<br>moving_average_3: NA","Index: 2013-10-30<br>moving_average_3: NA","Index: 2013-10-31<br>moving_average_3: NA","Index: 2013-11-01<br>moving_average_3: 1016.04","Index: 2013-11-02<br>moving_average_3: 1010.61","Index: 2013-11-03<br>moving_average_3: 1009.34","Index: 2013-11-04<br>moving_average_3: 1007.39","Index: 2013-11-05<br>moving_average_3: 991.34","Index: 2013-11-06<br>moving_average_3: 990.03","Index: 2013-11-07<br>moving_average_3: 985.3","Index: 2013-11-08<br>moving_average_3: 989.92","Index: 2013-11-09<br>moving_average_3: 983.98","Index: 2013-11-10<br>moving_average_3: 988.51","Index: 2013-11-11<br>moving_average_3: 981.09"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,0,255,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,null,null,null,null,null,1014.72,1005.62,999.61,1012.62,1002.61,1002.87,1004.74,1006.99,1016.02,1019.62,1027.8],"text":["Index: 2013-10-23<br>moving_average_3: NA","Index: 2013-10-24<br>moving_average_3: NA","Index: 2013-10-25<br>moving_average_3: NA","Index: 2013-10-26<br>moving_average_3: NA","Index: 2013-10-27<br>moving_average_3: NA","Index: 2013-10-28<br>moving_average_3: NA","Index: 2013-10-29<br>moving_average_3: NA","Index: 2013-10-30<br>moving_average_3: NA","Index: 2013-10-31<br>moving_average_3: NA","Index: 2013-11-01<br>moving_average_3: 1014.72","Index: 2013-11-02<br>moving_average_3: 1005.62","Index: 2013-11-03<br>moving_average_3: 999.61","Index: 2013-11-04<br>moving_average_3: 1012.62","Index: 2013-11-05<br>moving_average_3: 1002.61","Index: 2013-11-06<br>moving_average_3: 1002.87","Index: 2013-11-07<br>moving_average_3: 1004.74","Index: 2013-11-08<br>moving_average_3: 1006.99","Index: 2013-11-09<br>moving_average_3: 1016.02","Index: 2013-11-10<br>moving_average_3: 1019.62","Index: 2013-11-11<br>moving_average_3: 1027.8"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,0,255,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,null,null,null,null,null,998.59,990.24,1002.25,994.19,1012.54,1014.89,1015.02,1007.44,1018.51,1025.49,1021.39],"text":["Index: 2013-10-23<br>moving_average_3: NA","Index: 2013-10-24<br>moving_average_3: NA","Index: 2013-10-25<br>moving_average_3: NA","Index: 2013-10-26<br>moving_average_3: NA","Index: 2013-10-27<br>moving_average_3: NA","Index: 2013-10-28<br>moving_average_3: NA","Index: 2013-10-29<br>moving_average_3: NA","Index: 2013-10-30<br>moving_average_3: NA","Index: 2013-10-31<br>moving_average_3: NA","Index: 2013-11-01<br>moving_average_3: 998.59","Index: 2013-11-02<br>moving_average_3: 990.24","Index: 2013-11-03<br>moving_average_3: 1002.25","Index: 2013-11-04<br>moving_average_3: 994.19","Index: 2013-11-05<br>moving_average_3: 1012.54","Index: 2013-11-06<br>moving_average_3: 1014.89","Index: 2013-11-07<br>moving_average_3: 1015.02","Index: 2013-11-08<br>moving_average_3: 1007.44","Index: 2013-11-09<br>moving_average_3: 1018.51","Index: 2013-11-10<br>moving_average_3: 1025.49","Index: 2013-11-11<br>moving_average_3: 1021.39"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,0,255,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y3","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,1004.32,1026.46,1026.08,1047.2,1020.92,1027.76,994.76,992.6,967.58,961.76,952.3,975.84,987.24,1000.38,1015.26,1009.88],"text":["Index: 2013-10-23<br>moving_average_2: NA","Index: 2013-10-24<br>moving_average_2: NA","Index: 2013-10-25<br>moving_average_2: NA","Index: 2013-10-26<br>moving_average_2: NA","Index: 2013-10-27<br>moving_average_2: 1004.32","Index: 2013-10-28<br>moving_average_2: 1026.46","Index: 2013-10-29<br>moving_average_2: 1026.08","Index: 2013-10-30<br>moving_average_2: 1047.2","Index: 2013-10-31<br>moving_average_2: 1020.92","Index: 2013-11-01<br>moving_average_2: 1027.76","Index: 2013-11-02<br>moving_average_2: 994.76","Index: 2013-11-03<br>moving_average_2: 992.6","Index: 2013-11-04<br>moving_average_2: 967.58","Index: 2013-11-05<br>moving_average_2: 961.76","Index: 2013-11-06<br>moving_average_2: 952.3","Index: 2013-11-07<br>moving_average_2: 975.84","Index: 2013-11-08<br>moving_average_2: 987.24","Index: 2013-11-09<br>moving_average_2: 1000.38","Index: 2013-11-10<br>moving_average_2: 1015.26","Index: 2013-11-11<br>moving_average_2: 1009.88"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(255,0,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,1039.2,1045.12,1027.22,1038.22,1011.08,990.24,966.12,972,987.02,994.14,1015.5,1043.36,1041.98,1045.02,1045.1,1040.1],"text":["Index: 2013-10-23<br>moving_average_2: NA","Index: 2013-10-24<br>moving_average_2: NA","Index: 2013-10-25<br>moving_average_2: NA","Index: 2013-10-26<br>moving_average_2: NA","Index: 2013-10-27<br>moving_average_2: 1039.2","Index: 2013-10-28<br>moving_average_2: 1045.12","Index: 2013-10-29<br>moving_average_2: 1027.22","Index: 2013-10-30<br>moving_average_2: 1038.22","Index: 2013-10-31<br>moving_average_2: 1011.08","Index: 2013-11-01<br>moving_average_2: 990.24","Index: 2013-11-02<br>moving_average_2: 966.12","Index: 2013-11-03<br>moving_average_2: 972","Index: 2013-11-04<br>moving_average_2: 987.02","Index: 2013-11-05<br>moving_average_2: 994.14","Index: 2013-11-06<br>moving_average_2: 1015.5","Index: 2013-11-07<br>moving_average_2: 1043.36","Index: 2013-11-08<br>moving_average_2: 1041.98","Index: 2013-11-09<br>moving_average_2: 1045.02","Index: 2013-11-10<br>moving_average_2: 1045.1","Index: 2013-11-11<br>moving_average_2: 1040.1"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(255,0,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,999.88,1002.6,1026.38,999.58,991.26,997.3,977.88,978.12,988.8,1033.82,1032.48,1052.16,1036.76,1048.22,1017.16,1010.3],"text":["Index: 2013-10-23<br>moving_average_2: NA","Index: 2013-10-24<br>moving_average_2: NA","Index: 2013-10-25<br>moving_average_2: NA","Index: 2013-10-26<br>moving_average_2: NA","Index: 2013-10-27<br>moving_average_2: 999.88","Index: 2013-10-28<br>moving_average_2: 1002.6","Index: 2013-10-29<br>moving_average_2: 1026.38","Index: 2013-10-30<br>moving_average_2: 999.58","Index: 2013-10-31<br>moving_average_2: 991.26","Index: 2013-11-01<br>moving_average_2: 997.3","Index: 2013-11-02<br>moving_average_2: 977.88","Index: 2013-11-03<br>moving_average_2: 978.12","Index: 2013-11-04<br>moving_average_2: 988.8","Index: 2013-11-05<br>moving_average_2: 1033.82","Index: 2013-11-06<br>moving_average_2: 1032.48","Index: 2013-11-07<br>moving_average_2: 1052.16","Index: 2013-11-08<br>moving_average_2: 1036.76","Index: 2013-11-09<br>moving_average_2: 1048.22","Index: 2013-11-10<br>moving_average_2: 1017.16","Index: 2013-11-11<br>moving_average_2: 1010.3"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(255,0,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y3","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,972.25,987.05,1051.2,1043.2,1023.25,1026.65,1038.9,1038.3,994.6,957.85,938.75,970.95,961.2,956.4,993.05,1026.1,1032.3,1031.25,980.15],"text":["Index: 2013-10-23<br>moving_average_1: NA","Index: 2013-10-24<br>moving_average_1: 972.25","Index: 2013-10-25<br>moving_average_1: 987.05","Index: 2013-10-26<br>moving_average_1: 1051.2","Index: 2013-10-27<br>moving_average_1: 1043.2","Index: 2013-10-28<br>moving_average_1: 1023.25","Index: 2013-10-29<br>moving_average_1: 1026.65","Index: 2013-10-30<br>moving_average_1: 1038.9","Index: 2013-10-31<br>moving_average_1: 1038.3","Index: 2013-11-01<br>moving_average_1: 994.6","Index: 2013-11-02<br>moving_average_1: 957.85","Index: 2013-11-03<br>moving_average_1: 938.75","Index: 2013-11-04<br>moving_average_1: 970.95","Index: 2013-11-05<br>moving_average_1: 961.2","Index: 2013-11-06<br>moving_average_1: 956.4","Index: 2013-11-07<br>moving_average_1: 993.05","Index: 2013-11-08<br>moving_average_1: 1026.1","Index: 2013-11-09<br>moving_average_1: 1032.3","Index: 2013-11-10<br>moving_average_1: 1031.25","Index: 2013-11-11<br>moving_average_1: 980.15"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,255,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,1067.75,1034.55,1022.45,1047.65,1038.4,1037.8,1017.3,982.1,927.7,926,992.2,1069.55,1037.45,998.9,1049.05,1058.4,1073.7,1045.25,986.6],"text":["Index: 2013-10-23<br>moving_average_1: NA","Index: 2013-10-24<br>moving_average_1: 1067.75","Index: 2013-10-25<br>moving_average_1: 1034.55","Index: 2013-10-26<br>moving_average_1: 1022.45","Index: 2013-10-27<br>moving_average_1: 1047.65","Index: 2013-10-28<br>moving_average_1: 1038.4","Index: 2013-10-29<br>moving_average_1: 1037.8","Index: 2013-10-30<br>moving_average_1: 1017.3","Index: 2013-10-31<br>moving_average_1: 982.1","Index: 2013-11-01<br>moving_average_1: 927.7","Index: 2013-11-02<br>moving_average_1: 926","Index: 2013-11-03<br>moving_average_1: 992.2","Index: 2013-11-04<br>moving_average_1: 1069.55","Index: 2013-11-05<br>moving_average_1: 1037.45","Index: 2013-11-06<br>moving_average_1: 998.9","Index: 2013-11-07<br>moving_average_1: 1049.05","Index: 2013-11-08<br>moving_average_1: 1058.4","Index: 2013-11-09<br>moving_average_1: 1073.7","Index: 2013-11-10<br>moving_average_1: 1045.25","Index: 2013-11-11<br>moving_average_1: 986.6"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,255,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,971.1,993.25,1009.65,981.6,1050.6,1037.35,985.7,921.85,975.9,1017.15,989.4,1013,1061.1,1085.1,1063,1000.1,1003.15,1012.1,990.3],"text":["Index: 2013-10-23<br>moving_average_1: NA","Index: 2013-10-24<br>moving_average_1: 971.1","Index: 2013-10-25<br>moving_average_1: 993.25","Index: 2013-10-26<br>moving_average_1: 1009.65","Index: 2013-10-27<br>moving_average_1: 981.6","Index: 2013-10-28<br>moving_average_1: 1050.6","Index: 2013-10-29<br>moving_average_1: 1037.35","Index: 2013-10-30<br>moving_average_1: 985.7","Index: 2013-10-31<br>moving_average_1: 921.85","Index: 2013-11-01<br>moving_average_1: 975.9","Index: 2013-11-02<br>moving_average_1: 1017.15","Index: 2013-11-03<br>moving_average_1: 989.4","Index: 2013-11-04<br>moving_average_1: 1013","Index: 2013-11-05<br>moving_average_1: 1061.1","Index: 2013-11-06<br>moving_average_1: 1085.1","Index: 2013-11-07<br>moving_average_1: 1063","Index: 2013-11-08<br>moving_average_1: 1000.1","Index: 2013-11-09<br>moving_average_1: 1003.15","Index: 2013-11-10<br>moving_average_1: 1012.1","Index: 2013-11-11<br>moving_average_1: 990.3"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,255,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y3","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[961.1,983.4,990.7,1111.7,974.7,1071.8,981.5,1096.3,980.3,1008.9,906.8,970.7,971.2,951.2,961.6,1024.5,1027.7,1036.9,1025.6,934.7],"text":["Index: 2013-10-23<br>value: 961.1","Index: 2013-10-24<br>value: 983.4","Index: 2013-10-25<br>value: 990.7","Index: 2013-10-26<br>value: 1111.7","Index: 2013-10-27<br>value: 974.7","Index: 2013-10-28<br>value: 1071.8","Index: 2013-10-29<br>value: 981.5","Index: 2013-10-30<br>value: 1096.3","Index: 2013-10-31<br>value: 980.3","Index: 2013-11-01<br>value: 1008.9","Index: 2013-11-02<br>value: 906.8","Index: 2013-11-03<br>value: 970.7","Index: 2013-11-04<br>value: 971.2","Index: 2013-11-05<br>value: 951.2","Index: 2013-11-06<br>value: 961.6","Index: 2013-11-07<br>value: 1024.5","Index: 2013-11-08<br>value: 1027.7","Index: 2013-11-09<br>value: 1036.9","Index: 2013-11-10<br>value: 1025.6","Index: 2013-11-11<br>value: 934.7"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgb(0,0,0)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[1031.6,1103.9,965.2,1079.7,1015.6,1061.2,1014.4,1020.2,944,911.4,940.6,1043.8,1095.3,979.6,1018.2,1079.9,1036.9,1110.5,980,993.2],"text":["Index: 2013-10-23<br>value: 1031.6","Index: 2013-10-24<br>value: 1103.9","Index: 2013-10-25<br>value: 965.2","Index: 2013-10-26<br>value: 1079.7","Index: 2013-10-27<br>value: 1015.6","Index: 2013-10-28<br>value: 1061.2","Index: 2013-10-29<br>value: 1014.4","Index: 2013-10-30<br>value: 1020.2","Index: 2013-10-31<br>value: 944","Index: 2013-11-01<br>value: 911.4","Index: 2013-11-02<br>value: 940.6","Index: 2013-11-03<br>value: 1043.8","Index: 2013-11-04<br>value: 1095.3","Index: 2013-11-05<br>value: 979.6","Index: 2013-11-06<br>value: 1018.2","Index: 2013-11-07<br>value: 1079.9","Index: 2013-11-08<br>value: 1036.9","Index: 2013-11-09<br>value: 1110.5","Index: 2013-11-10<br>value: 980","Index: 2013-11-11<br>value: 993.2"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgb(0,0,0)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[1049.7,892.5,1094,925.3,1037.9,1063.3,1011.4,960,883.7,1068.1,966.2,1012.6,1013.4,1108.8,1061.4,1064.6,935.6,1070.7,953.5,1027.1],"text":["Index: 2013-10-23<br>value: 1049.7","Index: 2013-10-24<br>value: 892.5","Index: 2013-10-25<br>value: 1094","Index: 2013-10-26<br>value: 925.3","Index: 2013-10-27<br>value: 1037.9","Index: 2013-10-28<br>value: 1063.3","Index: 2013-10-29<br>value: 1011.4","Index: 2013-10-30<br>value: 960","Index: 2013-10-31<br>value: 883.7","Index: 2013-11-01<br>value: 1068.1","Index: 2013-11-02<br>value: 966.2","Index: 2013-11-03<br>value: 1012.6","Index: 2013-11-04<br>value: 1013.4","Index: 2013-11-05<br>value: 1108.8","Index: 2013-11-06<br>value: 1061.4","Index: 2013-11-07<br>value: 1064.6","Index: 2013-11-08<br>value: 935.6","Index: 2013-11-09<br>value: 1070.7","Index: 2013-11-10<br>value: 953.5","Index: 2013-11-11<br>value: 1027.1"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgb(0,0,0)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y3","hoverinfo":"text"}],"layout":{"margin":{"b":27.8953922789539,"l":37.4595267745953,"t":59.0386052303861,"r":20.7222914072229},"plot_bgcolor":"rgb(255,255,255)","paper_bgcolor":"rgb(255,255,255)","font":{"color":"rgb(0,0,0)","family":"","size":15.9402241594022},"title":"Moving average time series plot","titlefont":{"color":"rgb(0,0,0)","family":"","size":19.1282689912827},"xaxis":{"type":"linear","autorange":false,"tickmode":"array","range":[1382404320000,1384210080000],"ticktext":["10 28","11 04","11 11"],"tickvals":[1382918400000,1383523200000,1384128000000],"ticks":"outside","tickcolor":"rgb(0,0,0)","ticklen":3.98505603985056,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgb(0,0,0)","family":"","size":12.7521793275218},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0,1],"gridcolor":"rgb(229,229,229)","gridwidth":0.265670402656704,"zeroline":false,"anchor":"y3","hoverformat":".2f"},"yaxis":{"type":"linear","autorange":false,"tickmode":"array","range":[872.3,1123.1],"ticktext":["900","950","1000","1050","1100"],"tickvals":[900,950,1000,1050,1100],"ticks":"outside","tickcolor":"rgb(0,0,0)","ticklen":3.98505603985056,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgb(0,0,0)","family":"","size":12.7521793275218},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.683271066832711,1],"gridcolor":"rgb(229,229,229)","gridwidth":0.265670402656704,"zeroline":false,"anchor":"x","hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":"transparent","line":{"color":"rgb(127,127,127)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.683271066832711,"y1":1},{"type":"rect","fillcolor":"rgb(204,204,204)","line":{"color":"rgb(127,127,127)","width":0.265670402656704,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":1,"y1":1.0755905511811},{"type":"rect","fillcolor":"rgb(204,204,204)","line":{"color":"rgb(127,127,127)","width":0.265670402656704,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.05399325084364,"y0":0.683271066832711,"y1":1},{"type":"rect","fillcolor":"transparent","line":{"color":"rgb(127,127,127)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.349937733499377,"y1":0.650062266500623},{"type":"rect","fillcolor":"rgb(204,204,204)","line":{"color":"rgb(127,127,127)","width":0.265670402656704,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.05399325084364,"y0":0.349937733499377,"y1":0.650062266500623},{"type":"rect","fillcolor":"transparent","line":{"color":"rgb(127,127,127)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":0.316728933167289},{"type":"rect","fillcolor":"rgb(204,204,204)","line":{"color":"rgb(127,127,127)","width":0.265670402656704,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.05399325084364,"y0":0,"y1":0.316728933167289}],"annotations":[{"text":"Fund_1","x":1,"y":0.841635533416355,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgb(26,26,26)","family":"","size":12.7521793275218},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Fund_2","x":1,"y":0.5,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgb(26,26,26)","family":"","size":12.7521793275218},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Fund_3","x":1,"y":0.158364466583645,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgb(26,26,26)","family":"","size":12.7521793275218},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"}],"yaxis2":{"type":"linear","autorange":false,"tickmode":"array","range":[872.3,1123.1],"ticktext":["900","950","1000","1050","1100"],"tickvals":[900,950,1000,1050,1100],"ticks":"outside","tickcolor":"rgb(0,0,0)","ticklen":3.98505603985056,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgb(0,0,0)","family":"","size":12.7521793275218},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.349937733499377,0.650062266500623],"gridcolor":"rgb(229,229,229)","gridwidth":0.265670402656704,"zeroline":false,"anchor":"x","hoverformat":".2f"},"yaxis3":{"type":"linear","autorange":false,"tickmode":"array","range":[872.3,1123.1],"ticktext":["900","950","1000","1050","1100"],"tickvals":[900,950,1000,1050,1100],"ticks":"outside","tickcolor":"rgb(0,0,0)","ticklen":3.98505603985056,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgb(0,0,0)","family":"","size":12.7521793275218},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0,0.316728933167289],"gridcolor":"rgb(229,229,229)","gridwidth":0.265670402656704,"zeroline":false,"anchor":"x","hoverformat":".2f"},"showlegend":false,"legend":{"bgcolor":"rgb(255,255,255)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgb(0,0,0)","family":"","size":12.7521793275218}},"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToRemove":["sendDataToCloud"]},"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

