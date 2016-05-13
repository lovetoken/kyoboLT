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
## 2013-10-23 1097.4 1046.1 1028.2
## 2013-10-24  922.2  954.2  975.6
## 2013-10-25 1105.0  980.4 1067.0
## 2013-10-26  965.0  934.8 1127.0
## 2013-10-27 1114.7 1032.5 1096.6
## 2013-10-28 1021.7 1116.1  918.6
## 2013-10-29  977.4 1013.3 1055.8
## 2013-10-30  858.6 1087.4  926.0
## 2013-10-31  920.6  972.2  934.1
## 2013-11-01 1043.8  884.7 1121.6
## 2013-11-02 1154.8  945.6  990.3
## 2013-11-03 1001.1  919.7 1040.1
## 2013-11-04 1106.8  991.7  904.3
## 2013-11-05  967.9 1080.3  971.8
## 2013-11-06  940.5 1076.4  978.6
## 2013-11-07 1040.0  960.6 1023.0
## 2013-11-08 1038.4  967.8 1149.3
## 2013-11-09  973.3 1013.1 1125.7
## 2013-11-10  899.7 1006.1  944.1
## 2013-11-11  973.7  903.6 1063.2
```

```r
Xday_returns(data, Xday=3) # basic 3 day returns
```

```
##                 Fund_1      Fund_2      Fund_3
## 2013-10-23          NA          NA          NA
## 2013-10-24          NA          NA          NA
## 2013-10-25          NA          NA          NA
## 2013-10-26 -0.12064881 -0.10639518  0.09609025
## 2013-10-27  0.20873997  0.08205827  0.12402624
## 2013-10-28 -0.07538462  0.13841289 -0.13908154
## 2013-10-29  0.01284974  0.08397518 -0.06317657
## 2013-10-30 -0.22974791  0.05317191 -0.15557177
## 2013-10-31 -0.09895273 -0.12893110  0.01687350
## 2013-11-01  0.06793534 -0.12691207  0.06232241
## 2013-11-02  0.34498020 -0.13040280  0.06943844
## 2013-11-03  0.08744297 -0.05400123  0.11347821
## 2013-11-04  0.06035639  0.12094495 -0.19374108
## 2013-11-05 -0.16184621  0.14244924 -0.01868121
## 2013-11-06 -0.06053341  0.17038165 -0.05912893
## 2013-11-07 -0.06035417 -0.03136029  0.13126175
## 2013-11-08  0.07283810 -0.10413774  0.18265075
## 2013-11-09  0.03487507 -0.05880713  0.15031678
## 2013-11-10 -0.13490385  0.04736623 -0.07712610
## 2013-11-11 -0.06230740 -0.06633602 -0.07491517
```

```r
Xday_returns(data, Xday=3, log.returns = T) # calculation 3 day log returns
```

```
##                 Fund_1      Fund_2      Fund_3
## 2013-10-23          NA          NA          NA
## 2013-10-24          NA          NA          NA
## 2013-10-25          NA          NA          NA
## 2013-10-26 -0.12857092 -0.11249164  0.09174953
## 2013-10-27  0.18957847  0.07886503  0.11691710
## 2013-10-28 -0.07837743  0.12963509 -0.14975548
## 2013-10-29  0.01276788  0.08063501 -0.06526046
## 2013-10-30 -0.26103743  0.05180648 -0.16909553
## 2013-10-31 -0.10419755 -0.13803420  0.01673273
## 2013-11-01  0.06572719 -0.13571901  0.06045746
## 2013-11-02  0.29637929 -0.13972516  0.06713369
## 2013-11-03  0.08382904 -0.05551401  0.10748864
## 2013-11-04  0.05860507  0.11417204 -0.21535035
## 2013-11-05 -0.17655367  0.13317441 -0.01885791
## 2013-11-06 -0.06244303  0.15732989 -0.06094916
## 2013-11-07 -0.06225226 -0.03186255  0.12333360
## 2013-11-08  0.07030757 -0.10996860  0.16775832
## 2013-11-09  0.03428071 -0.06060720  0.14003736
## 2013-11-10 -0.14491462  0.04627866 -0.08026267
## 2013-11-11 -0.06433310 -0.06863867 -0.07786983
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

<!--html_preserve--><div id="htmlwidget-1214" style="width:672px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-1214">{"x":{"data":[{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,null,null,null,null,null,1002.64,1008.38,1016.27,1016.45,1016.74,999.32,1001.15,1007.25,1018.72,1016.63,1009.62],"text":["Index: 2013-10-23<br>moving_average_3: NA","Index: 2013-10-24<br>moving_average_3: NA","Index: 2013-10-25<br>moving_average_3: NA","Index: 2013-10-26<br>moving_average_3: NA","Index: 2013-10-27<br>moving_average_3: NA","Index: 2013-10-28<br>moving_average_3: NA","Index: 2013-10-29<br>moving_average_3: NA","Index: 2013-10-30<br>moving_average_3: NA","Index: 2013-10-31<br>moving_average_3: NA","Index: 2013-11-01<br>moving_average_3: 1002.64","Index: 2013-11-02<br>moving_average_3: 1008.38","Index: 2013-11-03<br>moving_average_3: 1016.27","Index: 2013-11-04<br>moving_average_3: 1016.45","Index: 2013-11-05<br>moving_average_3: 1016.74","Index: 2013-11-06<br>moving_average_3: 999.32","Index: 2013-11-07<br>moving_average_3: 1001.15","Index: 2013-11-08<br>moving_average_3: 1007.25","Index: 2013-11-09<br>moving_average_3: 1018.72","Index: 2013-11-10<br>moving_average_3: 1016.63","Index: 2013-11-11<br>moving_average_3: 1009.62"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,0,255,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,null,null,null,null,null,1002.17,992.12,988.67,989.8,1004.35,1008.74,993.19,988.64,981.21,984.6,986.49],"text":["Index: 2013-10-23<br>moving_average_3: NA","Index: 2013-10-24<br>moving_average_3: NA","Index: 2013-10-25<br>moving_average_3: NA","Index: 2013-10-26<br>moving_average_3: NA","Index: 2013-10-27<br>moving_average_3: NA","Index: 2013-10-28<br>moving_average_3: NA","Index: 2013-10-29<br>moving_average_3: NA","Index: 2013-10-30<br>moving_average_3: NA","Index: 2013-10-31<br>moving_average_3: NA","Index: 2013-11-01<br>moving_average_3: 1002.17","Index: 2013-11-02<br>moving_average_3: 992.12","Index: 2013-11-03<br>moving_average_3: 988.67","Index: 2013-11-04<br>moving_average_3: 989.8","Index: 2013-11-05<br>moving_average_3: 1004.35","Index: 2013-11-06<br>moving_average_3: 1008.74","Index: 2013-11-07<br>moving_average_3: 993.19","Index: 2013-11-08<br>moving_average_3: 988.64","Index: 2013-11-09<br>moving_average_3: 981.21","Index: 2013-11-10<br>moving_average_3: 984.6","Index: 2013-11-11<br>moving_average_3: 986.49"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,0,255,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,null,null,null,null,null,1025.05,1021.26,1027.71,1011.44,995.92,984.12,994.56,1003.91,1023.88,1024.88,1019.04],"text":["Index: 2013-10-23<br>moving_average_3: NA","Index: 2013-10-24<br>moving_average_3: NA","Index: 2013-10-25<br>moving_average_3: NA","Index: 2013-10-26<br>moving_average_3: NA","Index: 2013-10-27<br>moving_average_3: NA","Index: 2013-10-28<br>moving_average_3: NA","Index: 2013-10-29<br>moving_average_3: NA","Index: 2013-10-30<br>moving_average_3: NA","Index: 2013-10-31<br>moving_average_3: NA","Index: 2013-11-01<br>moving_average_3: 1025.05","Index: 2013-11-02<br>moving_average_3: 1021.26","Index: 2013-11-03<br>moving_average_3: 1027.71","Index: 2013-11-04<br>moving_average_3: 1011.44","Index: 2013-11-05<br>moving_average_3: 995.92","Index: 2013-11-06<br>moving_average_3: 984.12","Index: 2013-11-07<br>moving_average_3: 994.56","Index: 2013-11-08<br>moving_average_3: 1003.91","Index: 2013-11-09<br>moving_average_3: 1023.88","Index: 2013-11-10<br>moving_average_3: 1024.88","Index: 2013-11-11<br>moving_average_3: 1019.04"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,0,255,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y3","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,1040.86,1025.72,1036.76,987.48,978.6,964.42,991.04,995.78,1045.42,1054.88,1034.22,1011.26,1018.72,992.02,978.38,985.02],"text":["Index: 2013-10-23<br>moving_average_2: NA","Index: 2013-10-24<br>moving_average_2: NA","Index: 2013-10-25<br>moving_average_2: NA","Index: 2013-10-26<br>moving_average_2: NA","Index: 2013-10-27<br>moving_average_2: 1040.86","Index: 2013-10-28<br>moving_average_2: 1025.72","Index: 2013-10-29<br>moving_average_2: 1036.76","Index: 2013-10-30<br>moving_average_2: 987.48","Index: 2013-10-31<br>moving_average_2: 978.6","Index: 2013-11-01<br>moving_average_2: 964.42","Index: 2013-11-02<br>moving_average_2: 991.04","Index: 2013-11-03<br>moving_average_2: 995.78","Index: 2013-11-04<br>moving_average_2: 1045.42","Index: 2013-11-05<br>moving_average_2: 1054.88","Index: 2013-11-06<br>moving_average_2: 1034.22","Index: 2013-11-07<br>moving_average_2: 1011.26","Index: 2013-11-08<br>moving_average_2: 1018.72","Index: 2013-11-09<br>moving_average_2: 992.02","Index: 2013-11-10<br>moving_average_2: 978.38","Index: 2013-11-11<br>moving_average_2: 985.02"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(255,0,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,989.6,1003.6,1015.42,1036.82,1044.3,1014.74,980.64,961.92,942.78,964.4,1002.74,1005.74,1015.36,1019.64,1004.8,970.24],"text":["Index: 2013-10-23<br>moving_average_2: NA","Index: 2013-10-24<br>moving_average_2: NA","Index: 2013-10-25<br>moving_average_2: NA","Index: 2013-10-26<br>moving_average_2: NA","Index: 2013-10-27<br>moving_average_2: 989.6","Index: 2013-10-28<br>moving_average_2: 1003.6","Index: 2013-10-29<br>moving_average_2: 1015.42","Index: 2013-10-30<br>moving_average_2: 1036.82","Index: 2013-10-31<br>moving_average_2: 1044.3","Index: 2013-11-01<br>moving_average_2: 1014.74","Index: 2013-11-02<br>moving_average_2: 980.64","Index: 2013-11-03<br>moving_average_2: 961.92","Index: 2013-11-04<br>moving_average_2: 942.78","Index: 2013-11-05<br>moving_average_2: 964.4","Index: 2013-11-06<br>moving_average_2: 1002.74","Index: 2013-11-07<br>moving_average_2: 1005.74","Index: 2013-11-08<br>moving_average_2: 1015.36","Index: 2013-11-09<br>moving_average_2: 1019.64","Index: 2013-11-10<br>moving_average_2: 1004.8","Index: 2013-11-11<br>moving_average_2: 970.24"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(255,0,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,null,null,null,1058.88,1036.96,1053,1024.8,986.22,991.22,1005.56,1002.42,998.08,1005.62,977.02,983.56,1005.4,1049.68,1044.14,1061.06],"text":["Index: 2013-10-23<br>moving_average_2: NA","Index: 2013-10-24<br>moving_average_2: NA","Index: 2013-10-25<br>moving_average_2: NA","Index: 2013-10-26<br>moving_average_2: NA","Index: 2013-10-27<br>moving_average_2: 1058.88","Index: 2013-10-28<br>moving_average_2: 1036.96","Index: 2013-10-29<br>moving_average_2: 1053","Index: 2013-10-30<br>moving_average_2: 1024.8","Index: 2013-10-31<br>moving_average_2: 986.22","Index: 2013-11-01<br>moving_average_2: 991.22","Index: 2013-11-02<br>moving_average_2: 1005.56","Index: 2013-11-03<br>moving_average_2: 1002.42","Index: 2013-11-04<br>moving_average_2: 998.08","Index: 2013-11-05<br>moving_average_2: 1005.62","Index: 2013-11-06<br>moving_average_2: 977.02","Index: 2013-11-07<br>moving_average_2: 983.56","Index: 2013-11-08<br>moving_average_2: 1005.4","Index: 2013-11-09<br>moving_average_2: 1049.68","Index: 2013-11-10<br>moving_average_2: 1044.14","Index: 2013-11-11<br>moving_average_2: 1061.06"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(255,0,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y3","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,1009.8,1013.6,1035,1039.85,1068.2,999.55,918,889.6,982.2,1099.3,1077.95,1053.95,1037.35,954.2,990.25,1039.2,1005.85,936.5,936.7],"text":["Index: 2013-10-23<br>moving_average_1: NA","Index: 2013-10-24<br>moving_average_1: 1009.8","Index: 2013-10-25<br>moving_average_1: 1013.6","Index: 2013-10-26<br>moving_average_1: 1035","Index: 2013-10-27<br>moving_average_1: 1039.85","Index: 2013-10-28<br>moving_average_1: 1068.2","Index: 2013-10-29<br>moving_average_1: 999.55","Index: 2013-10-30<br>moving_average_1: 918","Index: 2013-10-31<br>moving_average_1: 889.6","Index: 2013-11-01<br>moving_average_1: 982.2","Index: 2013-11-02<br>moving_average_1: 1099.3","Index: 2013-11-03<br>moving_average_1: 1077.95","Index: 2013-11-04<br>moving_average_1: 1053.95","Index: 2013-11-05<br>moving_average_1: 1037.35","Index: 2013-11-06<br>moving_average_1: 954.2","Index: 2013-11-07<br>moving_average_1: 990.25","Index: 2013-11-08<br>moving_average_1: 1039.2","Index: 2013-11-09<br>moving_average_1: 1005.85","Index: 2013-11-10<br>moving_average_1: 936.5","Index: 2013-11-11<br>moving_average_1: 936.7"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,255,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,1000.15,967.3,957.6,983.65,1074.3,1064.7,1050.35,1029.8,928.45,915.15,932.65,955.7,1036,1078.35,1018.5,964.2,990.45,1009.6,954.85],"text":["Index: 2013-10-23<br>moving_average_1: NA","Index: 2013-10-24<br>moving_average_1: 1000.15","Index: 2013-10-25<br>moving_average_1: 967.3","Index: 2013-10-26<br>moving_average_1: 957.6","Index: 2013-10-27<br>moving_average_1: 983.65","Index: 2013-10-28<br>moving_average_1: 1074.3","Index: 2013-10-29<br>moving_average_1: 1064.7","Index: 2013-10-30<br>moving_average_1: 1050.35","Index: 2013-10-31<br>moving_average_1: 1029.8","Index: 2013-11-01<br>moving_average_1: 928.45","Index: 2013-11-02<br>moving_average_1: 915.15","Index: 2013-11-03<br>moving_average_1: 932.65","Index: 2013-11-04<br>moving_average_1: 955.7","Index: 2013-11-05<br>moving_average_1: 1036","Index: 2013-11-06<br>moving_average_1: 1078.35","Index: 2013-11-07<br>moving_average_1: 1018.5","Index: 2013-11-08<br>moving_average_1: 964.2","Index: 2013-11-09<br>moving_average_1: 990.45","Index: 2013-11-10<br>moving_average_1: 1009.6","Index: 2013-11-11<br>moving_average_1: 954.85"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,255,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[null,1001.9,1021.3,1097,1111.8,1007.6,987.2,990.9,930.05,1027.85,1055.95,1015.2,972.2,938.05,975.2,1000.8,1086.15,1137.5,1034.9,1003.65],"text":["Index: 2013-10-23<br>moving_average_1: NA","Index: 2013-10-24<br>moving_average_1: 1001.9","Index: 2013-10-25<br>moving_average_1: 1021.3","Index: 2013-10-26<br>moving_average_1: 1097","Index: 2013-10-27<br>moving_average_1: 1111.8","Index: 2013-10-28<br>moving_average_1: 1007.6","Index: 2013-10-29<br>moving_average_1: 987.2","Index: 2013-10-30<br>moving_average_1: 990.9","Index: 2013-10-31<br>moving_average_1: 930.05","Index: 2013-11-01<br>moving_average_1: 1027.85","Index: 2013-11-02<br>moving_average_1: 1055.95","Index: 2013-11-03<br>moving_average_1: 1015.2","Index: 2013-11-04<br>moving_average_1: 972.2","Index: 2013-11-05<br>moving_average_1: 938.05","Index: 2013-11-06<br>moving_average_1: 975.2","Index: 2013-11-07<br>moving_average_1: 1000.8","Index: 2013-11-08<br>moving_average_1: 1086.15","Index: 2013-11-09<br>moving_average_1: 1137.5","Index: 2013-11-10<br>moving_average_1: 1034.9","Index: 2013-11-11<br>moving_average_1: 1003.65"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgba(0,255,0,0.4)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y3","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[1097.4,922.2,1105,965,1114.7,1021.7,977.4,858.6,920.6,1043.8,1154.8,1001.1,1106.8,967.9,940.5,1040,1038.4,973.3,899.7,973.7],"text":["Index: 2013-10-23<br>value: 1097.4","Index: 2013-10-24<br>value: 922.2","Index: 2013-10-25<br>value: 1105","Index: 2013-10-26<br>value: 965","Index: 2013-10-27<br>value: 1114.7","Index: 2013-10-28<br>value: 1021.7","Index: 2013-10-29<br>value: 977.4","Index: 2013-10-30<br>value: 858.6","Index: 2013-10-31<br>value: 920.6","Index: 2013-11-01<br>value: 1043.8","Index: 2013-11-02<br>value: 1154.8","Index: 2013-11-03<br>value: 1001.1","Index: 2013-11-04<br>value: 1106.8","Index: 2013-11-05<br>value: 967.9","Index: 2013-11-06<br>value: 940.5","Index: 2013-11-07<br>value: 1040","Index: 2013-11-08<br>value: 1038.4","Index: 2013-11-09<br>value: 973.3","Index: 2013-11-10<br>value: 899.7","Index: 2013-11-11<br>value: 973.7"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgb(0,0,0)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[1046.1,954.2,980.4,934.8,1032.5,1116.1,1013.3,1087.4,972.2,884.7,945.6,919.7,991.7,1080.3,1076.4,960.6,967.8,1013.1,1006.1,903.6],"text":["Index: 2013-10-23<br>value: 1046.1","Index: 2013-10-24<br>value: 954.2","Index: 2013-10-25<br>value: 980.4","Index: 2013-10-26<br>value: 934.8","Index: 2013-10-27<br>value: 1032.5","Index: 2013-10-28<br>value: 1116.1","Index: 2013-10-29<br>value: 1013.3","Index: 2013-10-30<br>value: 1087.4","Index: 2013-10-31<br>value: 972.2","Index: 2013-11-01<br>value: 884.7","Index: 2013-11-02<br>value: 945.6","Index: 2013-11-03<br>value: 919.7","Index: 2013-11-04<br>value: 991.7","Index: 2013-11-05<br>value: 1080.3","Index: 2013-11-06<br>value: 1076.4","Index: 2013-11-07<br>value: 960.6","Index: 2013-11-08<br>value: 967.8","Index: 2013-11-09<br>value: 1013.1","Index: 2013-11-10<br>value: 1006.1","Index: 2013-11-11<br>value: 903.6"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgb(0,0,0)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text"},{"x":[1382486400000,1382572800000,1382659200000,1382745600000,1382832000000,1382918400000,1383004800000,1383091200000,1383177600000,1383264000000,1383350400000,1383436800000,1383523200000,1383609600000,1383696000000,1383782400000,1383868800000,1383955200000,1384041600000,1384128000000],"y":[1028.2,975.6,1067,1127,1096.6,918.6,1055.8,926,934.1,1121.6,990.3,1040.1,904.3,971.8,978.6,1023,1149.3,1125.7,944.1,1063.2],"text":["Index: 2013-10-23<br>value: 1028.2","Index: 2013-10-24<br>value: 975.6","Index: 2013-10-25<br>value: 1067","Index: 2013-10-26<br>value: 1127","Index: 2013-10-27<br>value: 1096.6","Index: 2013-10-28<br>value: 918.6","Index: 2013-10-29<br>value: 1055.8","Index: 2013-10-30<br>value: 926","Index: 2013-10-31<br>value: 934.1","Index: 2013-11-01<br>value: 1121.6","Index: 2013-11-02<br>value: 990.3","Index: 2013-11-03<br>value: 1040.1","Index: 2013-11-04<br>value: 904.3","Index: 2013-11-05<br>value: 971.8","Index: 2013-11-06<br>value: 978.6","Index: 2013-11-07<br>value: 1023","Index: 2013-11-08<br>value: 1149.3","Index: 2013-11-09<br>value: 1125.7","Index: 2013-11-10<br>value: 944.1","Index: 2013-11-11<br>value: 1063.2"],"type":"scatter","mode":"lines","name":"","line":{"width":1.88976377952756,"color":"rgb(0,0,0)","dash":"solid"},"showlegend":false,"xaxis":"x","yaxis":"y3","hoverinfo":"text"}],"layout":{"margin":{"b":27.8953922789539,"l":37.4595267745953,"t":59.0386052303861,"r":20.7222914072229},"plot_bgcolor":"rgb(255,255,255)","paper_bgcolor":"rgb(255,255,255)","font":{"color":"rgb(0,0,0)","family":"","size":15.9402241594022},"title":"Moving average time series plot","titlefont":{"color":"rgb(0,0,0)","family":"","size":19.1282689912827},"xaxis":{"type":"linear","autorange":false,"tickmode":"array","range":[1382404320000,1384210080000],"ticktext":["10 28","11 04","11 11"],"tickvals":[1382918400000,1383523200000,1384128000000],"ticks":"outside","tickcolor":"rgb(0,0,0)","ticklen":3.98505603985056,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgb(0,0,0)","family":"","size":12.7521793275218},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0,1],"gridcolor":"rgb(229,229,229)","gridwidth":0.265670402656704,"zeroline":false,"anchor":"y3","hoverformat":".2f"},"yaxis":{"type":"linear","autorange":false,"tickmode":"array","range":[843.79,1169.61],"ticktext":["900","1000","1100"],"tickvals":[900,1000,1100],"ticks":"outside","tickcolor":"rgb(0,0,0)","ticklen":3.98505603985056,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgb(0,0,0)","family":"","size":12.7521793275218},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.683271066832711,1],"gridcolor":"rgb(229,229,229)","gridwidth":0.265670402656704,"zeroline":false,"anchor":"x","hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":"transparent","line":{"color":"rgb(127,127,127)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.683271066832711,"y1":1},{"type":"rect","fillcolor":"rgb(204,204,204)","line":{"color":"rgb(127,127,127)","width":0.265670402656704,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":1,"y1":1.0755905511811},{"type":"rect","fillcolor":"rgb(204,204,204)","line":{"color":"rgb(127,127,127)","width":0.265670402656704,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.05399325084364,"y0":0.683271066832711,"y1":1},{"type":"rect","fillcolor":"transparent","line":{"color":"rgb(127,127,127)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0.349937733499377,"y1":0.650062266500623},{"type":"rect","fillcolor":"rgb(204,204,204)","line":{"color":"rgb(127,127,127)","width":0.265670402656704,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.05399325084364,"y0":0.349937733499377,"y1":0.650062266500623},{"type":"rect","fillcolor":"transparent","line":{"color":"rgb(127,127,127)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":0.316728933167289},{"type":"rect","fillcolor":"rgb(204,204,204)","line":{"color":"rgb(127,127,127)","width":0.265670402656704,"linetype":"solid"},"yref":"paper","xref":"paper","x0":1,"x1":1.05399325084364,"y0":0,"y1":0.316728933167289}],"annotations":[{"text":"Fund_1","x":1,"y":0.841635533416355,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgb(26,26,26)","family":"","size":12.7521793275218},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Fund_2","x":1,"y":0.5,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgb(26,26,26)","family":"","size":12.7521793275218},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"},{"text":"Fund_3","x":1,"y":0.158364466583645,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgb(26,26,26)","family":"","size":12.7521793275218},"xref":"paper","yref":"paper","textangle":90,"xanchor":"left","yanchor":"middle"}],"yaxis2":{"type":"linear","autorange":false,"tickmode":"array","range":[843.79,1169.61],"ticktext":["900","1000","1100"],"tickvals":[900,1000,1100],"ticks":"outside","tickcolor":"rgb(0,0,0)","ticklen":3.98505603985056,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgb(0,0,0)","family":"","size":12.7521793275218},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.349937733499377,0.650062266500623],"gridcolor":"rgb(229,229,229)","gridwidth":0.265670402656704,"zeroline":false,"anchor":"x","hoverformat":".2f"},"yaxis3":{"type":"linear","autorange":false,"tickmode":"array","range":[843.79,1169.61],"ticktext":["900","1000","1100"],"tickvals":[900,1000,1100],"ticks":"outside","tickcolor":"rgb(0,0,0)","ticklen":3.98505603985056,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgb(0,0,0)","family":"","size":12.7521793275218},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0,0.316728933167289],"gridcolor":"rgb(229,229,229)","gridwidth":0.265670402656704,"zeroline":false,"anchor":"x","hoverformat":".2f"},"showlegend":false,"legend":{"bgcolor":"rgb(255,255,255)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgb(0,0,0)","family":"","size":12.7521793275218}},"hovermode":"closest"},"source":"A","config":{"modeBarButtonsToRemove":["sendDataToCloud"]},"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

