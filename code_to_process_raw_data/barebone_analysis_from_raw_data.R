#analysis with filtering
library(readr)
library(writexl)
library(ggplot2)
library(ggsignif)
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(plotly)
library(htmlwidgets)
library(gtools)
library(abind)
library(fractaldim)
library(readxl)

# path = "/Users/manna/Documents/Data/Current_Work/"
# path = "/Users/riddha/Documents/paper_data/"
path = "/Users/riddha/Documents/Current_work/"
setwd(path)
folders = c("operant_place","operant_color")

# setwd(paste0(path,folder))
operant_place_dates = c("20221222","20221229","20221230","20221231","20230101","20230223","20230224","20230225","20230226","20230414",
                        "20230417","20230419","20230421","20230424","20230428","20230609","20230612","20230619", "20230621","20230623",
                        "20230630","20230703","20230705","20230707","20230710","20230909","20230910","20230912","20240215","20240216",
                        "20240217","20240218","20240219","20240221")
operant_color_dates = c("20230806","20230909","20230929")

# operant_place_dates = c("20221222")
# operant_color_dates = c("20230806")

# #exps=unique(str_sub(str_remove(list.dirs(full.names = FALSE)[str_detect(list.dirs(full.names = FALSE),"csv/")],"/male|/female"),14,-1))

sexes = c("female", "male")
shock_arm = c(rep(c("L","M","R"),21),"L")
neutral_left_arm = c(rep(c("M","R","L"),21),"M")
neutral_right_arm = c(rep(c("R","L","M"),21),"R")
global_array = c()

box_width = 200
box_height = ceiling(box_width * 23 / 26)
y_mid = ceiling(15*box_height/23)
x_mid = (box_width / 2)

# these values are used to assign arms and shock during assay (might be changed in further iterastions of the assay code)
# LR_tolerance = 25
# M_tolerance = 5
# y_lim =  y_mid - M_tolerance 
# x_L_lim = (x_mid - LR_tolerance)
# x_R_lim = (x_mid + LR_tolerance)

len_mid = 25

time_tolerance = 20
timeStep = 10 #usually 60

arr_arm_pos = data.frame(pos = c(1,2,3))
rownames(arr_arm_pos) = c('L','M','R')
get_index_from_arm<-function(x){
  which(rownames(arr_arm_pos) == x)
}
color_code <- function(x){
  if(x == 'blue') return('B')
  else if(x == 'green') return('G')
  else if(x == 'red') return('R')
  return(NA)
}

turns<-function(x){
  if(x == 'LM' || x == 'MR' || x == 'RL') return(1) #left
  else if(x == 'LR' || x == 'RM' || x == 'ML') return(-1) #right
  return(NA)
}

get_activity_from_track <- function(track, frame_rate, activity_seconds_unit){
  track_activity = track[seq(1,length(track$V1),frame_rate*activity_seconds_unit),]
  avg_activity = c()
  for( j in 1:(length(track_activity$V1)-1)){
    dist = (1.0/activity_seconds_unit)*(25.0/box_width)*(((track_activity[j+1,]$V2 - track_activity[j,]$V2)^2 + (track_activity[j+1,]$V1 - track_activity[j,]$V1)^2)^0.5)
    avg_activity = c(avg_activity,dist)
  }
  global_array<<-avg_activity
  avg_activity = mean(avg_activity,na.rm=TRUE)
  return(avg_activity)
}

activity_filter <- function(exp,cutoff){
  return(quantile(df$activity[df$group==exp],cutoff,na.rm = TRUE))
}
rotate <- function(p, p0, alpha) {
  rotation_matrix <- matrix(c(cos(alpha), -sin(alpha), sin(alpha), cos(alpha)), nrow = 2, byrow = TRUE)
  result <- rotation_matrix %*% (p - p0) + p0
  return(result)
}

rotate_points <- function(points, p0, alpha) {
  result <- matrix(0, ncol = 2, nrow = length(points))
  for (i in 1:nrow(points)) {
    result[i, ] <- rotate(points[i, ], p0, alpha)
  }
  return(result)
}


CENTER_POINTSM <- do.call(rbind, lapply(seq(25,y_mid,5), function(y) c(100, y)))
CENTER_POINTSL <- rotate_points(CENTER_POINTSM, c(x_mid, y_mid), 2/3 * pi)
CENTER_POINTSL = CENTER_POINTSL[CENTER_POINTSL[,1]>=100,]
CENTER_POINTSR <- rotate_points(CENTER_POINTSM, c(x_mid, y_mid), -2/3 * pi)
CENTER_POINTSR = CENTER_POINTSR[CENTER_POINTSR[,1]<=100 & CENTER_POINTSR[,1]>0,]
CENTER_POINTS = rbind(CENTER_POINTSM,CENTER_POINTSL,CENTER_POINTSR)

offset_to_closest <- function(x, y) {
  closest = Inf
  dx = 0
  dy = 0
  for (i in 1:nrow(CENTER_POINTS)) {
    xr = CENTER_POINTS[i, 1]
    yr = CENTER_POINTS[i, 2]
    d = ((x - xr)^2) + ((y - yr)^2)
    if (d < closest) {
      closest = d
      dx = xr - x
      dy = yr - y
    }
  }
  return(list(dx, dy))
}

calibrate <- function(df, i = 0, max_iterations = 10) {
  offsets <- mapply(offset_to_closest, df$V1, df$V2)
  dx <- round(median(unlist(offsets[1,])))
  dy <- round(median(unlist(offsets[2,])))
  df$V1 <- df$V1 + dx
  df$V2 <- df$V2 + dy
  delta <- abs(dx) + abs(dy)
  df_temp = df[!(offsets[1,]>20 | offsets[2,]>20),]
  if(length(df_temp$V1) == 0 ){
    return(df)
  } else{
    df = df[!(offsets[1,]>20 | offsets[2,]>20),]
  }
  if (delta == 0 || i == max_iterations) {
    return(df)
  } else {
    return(calibrate(df, i + 1, max_iterations))
  }
}

values_parameter=c()
values_first_half_parameter=c()
values_second_half_parameter=c()
values_parameter_14=c()
values_parameter_24=c()
values_parameter_34=c()
values_parameter_44=c()
values_parameter_shockArm = c()
values_parameter_left=c()
values_parameter_right=c()
left_handedness = c()
first_half_left_handedness = c()
second_half_left_handedness = c()
left_handedness_14=c()
left_handedness_24=c()
left_handedness_34=c()
left_handedness_44=c()
values_starting_arm=c()
values_starting_color=c()
values_activity=c()
values_activity_shock=c()
values_activity_noShock=c()
values_activity_shock_color=c()
values_activity_noShock_color=c()
values_first_half_activity=c()
values_second_half_activity=c()
values_first_half_activity_shock_color=c()
values_second_half_activity_shock_color=c()
values_first_half_activity_noShock_color=c()
values_second_half_activity_noShock_color=c()
activity_14=c()
activity_24=c()
activity_34=c()
activity_44=c()
activity_shock_color_14 = c()
activity_shock_color_24 = c()
activity_shock_color_34 = c()
activity_shock_color_44 = c()
activity_noShock_color_14 = c()
activity_noShock_color_24 = c()
activity_noShock_color_34 = c()
activity_noShock_color_44 = c()
total_choices_arr = c()
correct_choices_arr = c()
incorrect_choices_arr = c()
first_half_total_choices_arr = c()
first_half_correct_choices_arr = c()
first_half_incorrect_choices_arr = c()
total_choices_14 = c()
total_choices_24 = c()
total_choices_34=c()
total_choices_44=c()
correct_choices_14 = c()
correct_choices_24 = c()
correct_choices_34=c()
correct_choices_44=c()
incorrect_choices_14 = c()
incorrect_choices_24 = c()
incorrect_choices_34=c()
incorrect_choices_44=c()
maxTime_arr = c()
learning_curves = list()
activity_curves = list()
activity_curves_shock = list()
activity_curves_noShock = list()

bias_values_parameter=c()
bias_left_handedness = c()
bias_values_activity=c()
bias_values_activity_shock=c()
bias_values_activity_noShock=c()
bias_values_activity_shock_color=c()
bias_values_activity_noShock_color=c()
bias_total_choices_arr = c()
bias_correct_choices_arr = c()
bias_incorrect_choices_arr = c()
bias_maxTime_arr = c()
bias_learning_curves = list()
bias_activity_curves = list()

post_values_parameter=c()
post_left_handedness = c()
post_first_half_left_handedness = c()
post_second_half_left_handedness = c()
post_values_activity=c()
post_values_activity_shock=c()
post_values_activity_noShock=c()
post_values_activity_shock_color=c()
post_values_activity_noShock_color=c()
post_total_choices_arr = c()
post_correct_choices_arr = c()
post_incorrect_choices_arr = c()
post_first_half_total_choices_arr = c()
post_first_half_correct_choices_arr = c()
post_first_half_incorrect_choices_arr = c()
post_maxTime_arr = c()
post_learning_curves = list()
post_activity_curves = list()

overall_learning_curves = list()

decisions = list()

#add activity curves


gr = c()
gr_sex = c()
sex_arr= c()
date_arr = c()
genotype_arr = c()
treatment_arr = c()
index_list = c()
reps = c()
ZT0s = c()
ZTs = c()
color_arr = c()
shock_arm_arr=c()
folder=c()
exp_type_arr=c()

count = 1

for(exp_type in folders){
  if(exp_type == 'operant_place'){dates = operant_place_dates}
  else if(exp_type == 'operant_color'){dates = operant_color_dates}
  setwd(exp_type)
  for(date in dates){
    setwd(date)
    #dir.create("traces")
    replicates = try(read.csv("replicates.csv",header = TRUE))
    ZT0 = try(read.csv("ZT0.csv",header = TRUE))
    colors_csv = try(read.csv("colors.csv",header = TRUE))
    setwd("csv")
    exps_date = unique(str_remove(list.dirs(full.names = FALSE)[str_detect(list.dirs(full.names = FALSE),"dgrp|dnc|ee")],"/male|/female"))
    exps_date = exps_date[!str_detect(exps_date,'move')]
    
    setwd("..")
    setwd("vids")
    assay_lines = unique(unlist(strsplit(exps_date,"_"))[seq(1,length(unlist(strsplit(exps_date,"_"))),2)])
    ZT_times = c()
    for(l in assay_lines){
      setwd(l)
      experiment_time <- try(read.delim("experiment_time.txt", header=FALSE),silent = T)
      if(class(experiment_time)!="try-error"){
        ZT_times = c(ZT_times,str_sub(experiment_time$V1[1],12,19))
      }
      else{
        ZT_times = c(ZT_times,NA)
      }
      setwd('..')
    }
    assay_times = data.frame(line = assay_lines,ZT=ZT_times)
    setwd('..')
    setwd("csv")
    
    for(exp in exps_date){
      line = unlist(strsplit(exp,"_"))[1]
      setwd(exp)
      for(sex in sexes){
        setwd(sex)
        # implement filters (total number of decisions?) and push NA instead of numeric value in the dataframe.
        for (i in 1:64){
          try_err <- try(read.csv(paste0("track_",i,".csv"), header=FALSE),silent=TRUE)
          if(class(try_err) != "try-error"){
            
            main_present = FALSE
            bias_present = FALSE
            post_present = FALSE
            gr = c(gr, exp)
            gr_sex = c(gr_sex, paste0(exp,"_",sex))
            sex_arr = c(sex_arr,sex)
            date_arr = c(date_arr,date)
            genotype_arr = c(genotype_arr, str_remove(exp,"_.*"))
            treatment_arr = c(treatment_arr, str_remove(exp,".*_"))
            reps = c(reps,as.character(replicates[i,line]))
            ZT0s = c(ZT0s,ZT0[i,line])
            ZTs = c(ZTs, assay_times[assay_times$line==line,]$ZT)
            color_arr = c(color_arr,colors_csv[i,line])
            if(exp_type == 'operant_place'){shock_arm_arr=c(shock_arm_arr,shock_arm[i])}
            else{shock_arm_arr=c(shock_arm_arr,NA)}
            index_list = c(index_list, as.character(i))
            folder = c(folder,str_remove(getwd(),path))
            exp_type_arr=c(exp_type_arr,exp_type)
            
            main_track = try(read.csv(paste0("track_",i,".csv"),header=FALSE))
            main_index = which(main_track$V1 > -1)
            # if something was detected during conditioning
            if(length(main_index) > 0){
              main_present = TRUE
              track = main_track
              index = main_index
              time = try(read.csv(paste0("time_",i,".csv"),header=FALSE))
              shock = try(read.csv(paste0("shock_",i,".csv"),header=FALSE))
              pattern = try(read.csv(paste0("pattern_",i,".csv"),header=FALSE))
              truncated_time = try(read.csv(paste0("truncated_time_",i,".csv"),header = FALSE))
              if(class(truncated_time)=='try-error'){
                truncated_time = data.frame(V1=0)
              }
              cummulative_scores = try(read.csv(paste0("cummulative_scores_",i,".csv"),header=FALSE))
              
              track = track[index,]
              track = calibrate(track)
              index = which(track$V1  > -1 & track$V2  > -1)
              rownames(track) = NULL

              arm = data.frame(V1=rep('X',length(track$V1)))
              arm$V1[which(track$V2 < y_mid - len_mid)] = 'M'
              arm$V1[which((track$V2 >= y_mid - len_mid) & (track$V1 < x_mid - len_mid*cos(pi/6)))] = 'L'
              arm$V1[which((track$V2 >= y_mid - len_mid) & (track$V1 > x_mid + len_mid*cos(pi/6)))] = 'R'

              time = data.frame(V1 = time[index,])
              rownames(time) = NULL

              shock= data.frame(V1 = shock[index,])
              rownames(shock) = NULL

              pattern= data.frame(V1 = pattern[index,])
              rownames(pattern) = NULL
              
              color_choice = str_sub(pattern$V1,lapply(arm$V1, get_index_from_arm),lapply(arm$V1, get_index_from_arm))
              
              track_shock = track
              track_shock[shock$V1 == "O",] = c(NA, NA)
              track_noShock = track
              track_noShock[shock$V1 == "X",] = c(NA, NA)
              track_shock_color = track[color_choice == color_code(colors_csv[i,line]),]
              rownames(track_shock_color) = NULL
              track_noShock_color = track[color_choice != color_code(colors_csv[i,line]),]
              rownames(track_noShock_color) = NULL
              
              # setting start time to 0
              time$V1 = time$V1 - time$V1[1] # because time is calculated right from the beginning
              time$V1=time$V1/1000000000
              time$V1[length(time$V1)] = ceiling(time$V1[length(time$V1)])
              
              truncated_time$V1 = truncated_time$V1 - time$V1[1]
              truncated_time$V1=truncated_time$V1/1000000000
              
              #for analysis of frac_time_on_shocked
              minTimeSec = 0
              maxTimeSec = 1200
              # stop_index = which(time$V1>=maxTimeSec)[1]
              stop_index = rev(which(time$V1>maxTimeSec-time_tolerance & time$V1<=maxTimeSec))[1]
              truncated_stop_index = which(truncated_time$V1>=maxTimeSec)[1]
              
              half_stop_index = rev(which(time$V1>maxTimeSec/2-time_tolerance & time$V1<=maxTimeSec/2))[1]
              truncated_half_stop_index = which(truncated_time$V1>=maxTimeSec/2)[1]
              
              stop_index_14 = rev(which(time$V1>maxTimeSec/4-time_tolerance & time$V1<=maxTimeSec/4))[1]
              truncated_stop_index_14 = which(truncated_time$V1>=maxTimeSec/4)[1]
              
              stop_index_34 = rev(which(time$V1>3*maxTimeSec/4-time_tolerance & time$V1<=3*maxTimeSec/4))[1]
              truncated_stop_index_34 = which(truncated_time$V1>=3*maxTimeSec/4)[1]
              
              if(is.na(stop_index)){
                maxTimeSec = 900
                stop_index = rev(which(time$V1>maxTimeSec-time_tolerance & time$V1<=maxTimeSec))[1]
                truncated_stop_index = which(truncated_time$V1>=maxTimeSec)[1]
                half_stop_index = rev(which(time$V1>maxTimeSec/2-time_tolerance & time$V1<=maxTimeSec/2))[1]
                truncated_half_stop_index = which(truncated_time$V1>=maxTimeSec/2)[1]
                stop_index_14 = rev(which(time$V1>maxTimeSec/4-time_tolerance & time$V1<=maxTimeSec/4))[1]
                truncated_stop_index_14 = which(truncated_time$V1>=maxTimeSec/4)[1]
                stop_index_34 = rev(which(time$V1>3*maxTimeSec/4-time_tolerance & time$V1<=3*maxTimeSec/4))[1]
                truncated_stop_index_34 = which(truncated_time$V1>=3*maxTimeSec/4)[1]
              }
              start_index = which(time$V1>=minTimeSec)[1]
              
              
              
              if(!is.na(stop_index)){
                maxTime_arr = c(maxTime_arr,maxTimeSec)
                # decision scores
                if(!is.na(truncated_stop_index)){
                  total_choices_arr = c(total_choices_arr,cummulative_scores$V1[truncated_stop_index])
                  correct_choices_arr = c(correct_choices_arr,cummulative_scores$V2[truncated_stop_index])
                  incorrect_choices_arr = c(incorrect_choices_arr,cummulative_scores$V3[truncated_stop_index])
                  
                  first_half_total_choices_arr = c(first_half_total_choices_arr,cummulative_scores$V1[truncated_half_stop_index])
                  first_half_correct_choices_arr = c(first_half_correct_choices_arr,cummulative_scores$V2[truncated_half_stop_index])
                  first_half_incorrect_choices_arr = c(first_half_incorrect_choices_arr,cummulative_scores$V3[truncated_half_stop_index])

                  total_choices_14 = c(total_choices_14,cummulative_scores$V1[truncated_stop_index_14])
                  correct_choices_14 = c(correct_choices_14,cummulative_scores$V2[truncated_stop_index_14])
                  incorrect_choices_14 = c(incorrect_choices_14,cummulative_scores$V3[truncated_stop_index_14])

                  total_choices_24 = c(total_choices_24,cummulative_scores$V1[truncated_half_stop_index]-cummulative_scores$V1[truncated_stop_index_14])
                  correct_choices_24 = c(correct_choices_24,cummulative_scores$V2[truncated_half_stop_index]-cummulative_scores$V2[truncated_stop_index_14])
                  incorrect_choices_24 = c(incorrect_choices_24,cummulative_scores$V3[truncated_half_stop_index]-cummulative_scores$V3[truncated_stop_index_14])

                  total_choices_34 = c(total_choices_34,cummulative_scores$V1[truncated_stop_index_34] - cummulative_scores$V1[truncated_half_stop_index])
                  correct_choices_34 = c(correct_choices_34,cummulative_scores$V2[truncated_stop_index_34]- cummulative_scores$V2[truncated_half_stop_index])
                  incorrect_choices_34 = c(incorrect_choices_34,cummulative_scores$V3[truncated_stop_index_34]- cummulative_scores$V3[truncated_half_stop_index])

                  total_choices_44 = c(total_choices_44,cummulative_scores$V1[truncated_stop_index] - cummulative_scores$V1[truncated_stop_index_34])
                  correct_choices_44 = c(correct_choices_44,cummulative_scores$V2[truncated_stop_index] - cummulative_scores$V2[truncated_stop_index_34])
                  incorrect_choices_44 = c(incorrect_choices_44,cummulative_scores$V3[truncated_stop_index] - cummulative_scores$V3[truncated_stop_index_34])
                  
                }
                else{
                  total_choices_arr = c(total_choices_arr,tail(cummulative_scores$V1,n=1))
                  correct_choices_arr = c(correct_choices_arr,tail(cummulative_scores$V2,n=1))
                  incorrect_choices_arr = c(incorrect_choices_arr,tail(cummulative_scores$V3,n=1))
                  
                  first_half_total_choices_arr = c(first_half_total_choices_arr,cummulative_scores$V1[truncated_half_stop_index])
                  first_half_correct_choices_arr = c(first_half_correct_choices_arr,cummulative_scores$V2[truncated_half_stop_index])
                  first_half_incorrect_choices_arr = c(first_half_incorrect_choices_arr,cummulative_scores$V3[truncated_half_stop_index])

                  total_choices_14 = c(total_choices_14,cummulative_scores$V1[truncated_stop_index_14])
                  correct_choices_14 = c(correct_choices_14,cummulative_scores$V2[truncated_stop_index_14])
                  incorrect_choices_14 = c(incorrect_choices_14,cummulative_scores$V3[truncated_stop_index_14])

                  total_choices_24 = c(total_choices_24,cummulative_scores$V1[truncated_half_stop_index]-cummulative_scores$V1[truncated_stop_index_14])
                  correct_choices_24 = c(correct_choices_24,cummulative_scores$V2[truncated_half_stop_index]-cummulative_scores$V2[truncated_stop_index_14])
                  incorrect_choices_24 = c(incorrect_choices_24,cummulative_scores$V3[truncated_half_stop_index]-cummulative_scores$V3[truncated_stop_index_14])

                  total_choices_34 = c(total_choices_34,cummulative_scores$V1[truncated_stop_index_34] - cummulative_scores$V1[truncated_half_stop_index])
                  correct_choices_34 = c(correct_choices_34,cummulative_scores$V2[truncated_stop_index_34]- cummulative_scores$V2[truncated_half_stop_index])
                  incorrect_choices_34 = c(incorrect_choices_34,cummulative_scores$V3[truncated_stop_index_34]- cummulative_scores$V3[truncated_half_stop_index])

                  total_choices_44 = c(total_choices_44,tail(cummulative_scores$V1,n=1) - cummulative_scores$V1[truncated_stop_index_34])
                  correct_choices_44 = c(correct_choices_44,tail(cummulative_scores$V2,n=1) - cummulative_scores$V2[truncated_stop_index_34])
                  incorrect_choices_44 = c(incorrect_choices_44,tail(cummulative_scores$V3,n=1) - cummulative_scores$V3[truncated_stop_index_34])
                }
                
                t = length(time$V1[start_index:stop_index])
                t_half_1 = length(time$V1[start_index:half_stop_index])
                t_half_2 = length(time$V1[half_stop_index:stop_index])
                t_14 = length(time$V1[start_index:stop_index_14])
                t_24 = length(time$V1[stop_index_14:half_stop_index])
                t_34 = length(time$V1[half_stop_index:stop_index_34])
                t_44 = length(time$V1[stop_index_34:stop_index])
                frame_rate = as.integer(t/(maxTimeSec - minTimeSec)) # framerate
                activity_seconds_unit = 1.0
                
                values_starting_arm = c(values_starting_arm, arm$V1[start_index])
                values_starting_color = c(values_starting_color, color_choice[start_index])
                
                x=sum(color_choice[start_index:stop_index] == color_code(colors_csv[i,line]),na.rm=TRUE)
                parameter = x/t
                values_parameter = c(values_parameter,parameter)
                
                x=sum(color_choice[start_index:half_stop_index] == color_code(colors_csv[i,line]),na.rm=TRUE)
                parameter = x/t_half_1
                values_first_half_parameter=c(values_first_half_parameter,parameter)
                
                x=sum(color_choice[half_stop_index:stop_index] == color_code(colors_csv[i,line]),na.rm=TRUE)
                parameter = x/t_half_2
                values_second_half_parameter=c(values_second_half_parameter,parameter)

                x=sum(color_choice[start_index:stop_index_14] == color_code(colors_csv[i,line]),na.rm=TRUE)
                parameter = x/t_14
                values_parameter_14 = c(values_parameter_14,parameter)

                x=sum(color_choice[stop_index_14:half_stop_index] == color_code(colors_csv[i,line]),na.rm=TRUE)
                parameter = x/t_24
                values_parameter_24 = c(values_parameter_24,parameter)

                 x=sum(color_choice[half_stop_index:stop_index_34] == color_code(colors_csv[i,line]),na.rm=TRUE)
                parameter = x/t_34
                values_parameter_34 = c(values_parameter_34,parameter)

                 x=sum(color_choice[stop_index_34:stop_index] == color_code(colors_csv[i,line]),na.rm=TRUE)
                parameter = x/t_44
                values_parameter_44 = c(values_parameter_44,parameter)
                
                tr_arm=arm$V1[start_index:stop_index][arm$V1[start_index:stop_index]!=c(arm$V1[start_index:stop_index][-1], FALSE)]
                tr_col=color_choice[start_index:stop_index][arm$V1[start_index:stop_index]!=c(arm$V1[start_index:stop_index][-1], FALSE)]
                tr_col=tr_col[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!='X']
                tr_col=tr_col[tr_arm!=c(tr_arm[-1], FALSE)]
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                turn_arr=sapply(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns,USE.NAMES = F), function(x) c('left','right')[x])
                tr_col=tr_col[-1]
                tr_choice=sapply(tr_col,function(x) if(str_to_upper(str_sub(colors_csv[i,line],1,1))==x)'X'else'O')
                tr_time=truncated_time$V1[-1]
                decisions[[count]] = paste0(tr_time,':',turn_arr,':',tr_col,':',tr_choice)
                
                tr_arm=arm$V1[start_index:stop_index][arm$V1[start_index:stop_index]!=c(arm$V1[start_index:stop_index][-1], FALSE)]
                tr_arm = tr_arm[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                left_handedness = c(left_handedness, mean(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns),na.rm=TRUE))
                
                tr_arm=arm$V1[start_index:half_stop_index][arm$V1[start_index:half_stop_index]!=c(arm$V1[start_index:half_stop_index][-1], FALSE)]
                tr_arm = tr_arm[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                first_half_left_handedness = c(first_half_left_handedness, mean(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns),na.rm=TRUE))
                
                tr_arm=arm$V1[half_stop_index:stop_index][arm$V1[half_stop_index:stop_index]!=c(arm$V1[half_stop_index:stop_index][-1], FALSE)]
                tr_arm = tr_arm[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                second_half_left_handedness = c(second_half_left_handedness, mean(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns),na.rm=TRUE))

                tr_arm=arm$V1[start_index:stop_index_14][arm$V1[start_index:stop_index_14]!=c(arm$V1[start_index:stop_index_14][-1], FALSE)]
                tr_arm = tr_arm[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                left_handedness_14 = c(left_handedness_14,mean(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns),na.rm=TRUE))
                
                tr_arm=arm$V1[stop_index_14:half_stop_index][arm$V1[stop_index_14:half_stop_index]!=c(arm$V1[stop_index_14:half_stop_index][-1], FALSE)]
                tr_arm = tr_arm[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                left_handedness_24 = c(left_handedness_24,mean(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns),na.rm=TRUE))
                
                tr_arm=arm$V1[half_stop_index:stop_index_34][arm$V1[half_stop_index:stop_index_34]!=c(arm$V1[half_stop_index:stop_index_34][-1], FALSE)]
                tr_arm = tr_arm[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                left_handedness_34 = c(left_handedness_34,mean(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns),na.rm=TRUE))
                
                tr_arm=arm$V1[stop_index_34:stop_index][arm$V1[stop_index_34:stop_index]!=c(arm$V1[stop_index_34:stop_index][-1], FALSE)]
                tr_arm = tr_arm[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                left_handedness_44 = c(left_handedness_44,mean(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns),na.rm=TRUE))
                
                if(exp_type == 'operant_place'){
                  x=sum(arm$V1[start_index:stop_index]==shock_arm[i])
                  parameter = x/t
                  values_parameter_shockArm = c(values_parameter_shockArm,parameter)
                  
                  x=sum(arm$V1[start_index:stop_index]==neutral_left_arm[i])
                  parameter = x/t
                  values_parameter_left = c(values_parameter_left,parameter)
                  
                  x=sum(arm$V1[start_index:stop_index]==neutral_right_arm[i])
                  parameter = x/t
                  values_parameter_right = c(values_parameter_right,parameter)
                }
                else if(exp_type == 'operant_color'){ #change later
                  values_parameter_shockArm = c(values_parameter_shockArm,NA)
                  values_parameter_left = c(values_parameter_left,NA)
                  values_parameter_right = c(values_parameter_right,NA)
                }
                
                # activity
                values_activity = c(values_activity, get_activity_from_track(track[start_index:stop_index,],frame_rate,activity_seconds_unit))
                activity_curves[[count]] = global_array
                values_first_half_activity=c(values_first_half_activity,get_activity_from_track(track[start_index:half_stop_index,],frame_rate,activity_seconds_unit))
                values_second_half_activity=c(values_second_half_activity,get_activity_from_track(track[half_stop_index:stop_index,],frame_rate,activity_seconds_unit))
                activity_14=c(activity_14,get_activity_from_track(track[start_index:stop_index_14,],frame_rate,activity_seconds_unit))
                activity_24=c(activity_24,get_activity_from_track(track[stop_index_14:half_stop_index,],frame_rate,activity_seconds_unit))
                activity_34=c(activity_34,get_activity_from_track(track[half_stop_index:stop_index_34,],frame_rate,activity_seconds_unit))
                activity_44=c(activity_44,get_activity_from_track(track[stop_index_34:stop_index,],frame_rate,activity_seconds_unit))
                
                values_activity_shock = c(values_activity_shock, get_activity_from_track(track_shock[start_index:stop_index,],frame_rate,activity_seconds_unit))
                activity_curves_shock[[count]]=global_array
                values_activity_noShock = c(values_activity_noShock, get_activity_from_track(track_noShock[start_index:stop_index,],frame_rate,activity_seconds_unit))
                activity_curves_noShock[[count]] = global_array
                
                values_activity_shock_color = c(values_activity_shock_color, get_activity_from_track(track_shock_color[start_index:stop_index,],frame_rate,activity_seconds_unit))
                values_first_half_activity_shock_color=c(values_first_half_activity_shock_color,get_activity_from_track(track_shock_color[start_index:half_stop_index,],frame_rate,activity_seconds_unit))
                values_second_half_activity_shock_color=c(values_second_half_activity_shock_color,get_activity_from_track(track_shock_color[half_stop_index:stop_index,],frame_rate,activity_seconds_unit))
                activity_shock_color_14 = c(activity_shock_color_14,get_activity_from_track(track_shock_color[start_index:stop_index_14,],frame_rate,activity_seconds_unit))
                activity_shock_color_24 = c(activity_shock_color_24,get_activity_from_track(track_shock_color[stop_index_14:half_stop_index,],frame_rate,activity_seconds_unit))
                activity_shock_color_34 = c(activity_shock_color_34,get_activity_from_track(track_shock_color[half_stop_index:stop_index_34,],frame_rate,activity_seconds_unit))
                activity_shock_color_44 = c(activity_shock_color_44,get_activity_from_track(track_shock_color[stop_index_34:stop_index,],frame_rate,activity_seconds_unit))

                values_activity_noShock_color = c(values_activity_noShock_color, get_activity_from_track(track_noShock_color[start_index:stop_index,],frame_rate,activity_seconds_unit))
                values_first_half_activity_noShock_color=c(values_first_half_activity_noShock_color,get_activity_from_track(track_noShock_color[start_index:half_stop_index,],frame_rate,activity_seconds_unit))
                values_second_half_activity_noShock_color=c(values_second_half_activity_noShock_color,get_activity_from_track(track_noShock_color[half_stop_index:stop_index,],frame_rate,activity_seconds_unit))
                activity_noShock_color_14 = c(activity_noShock_color_14,get_activity_from_track(track_noShock_color[start_index:stop_index_14,],frame_rate,activity_seconds_unit))
                activity_noShock_color_24 = c(activity_noShock_color_24,get_activity_from_track(track_noShock_color[stop_index_14:half_stop_index,],frame_rate,activity_seconds_unit))
                activity_noShock_color_34 = c(activity_noShock_color_34,get_activity_from_track(track_noShock_color[half_stop_index:stop_index_34,],frame_rate,activity_seconds_unit))
                activity_noShock_color_44 = c(activity_noShock_color_44,get_activity_from_track(track_noShock_color[stop_index_34:stop_index,],frame_rate,activity_seconds_unit))
                
                #learning curves
                start_time = 0
                stop_time = maxTimeSec
                time_step = timeStep
                times = seq(start_time+time_step,stop_time,time_step)
                start = which(time$V1>=start_time)[1]
                learning_curve = c()
                for(ts in times){
                  stop = rev(which(time$V1>ts-time_tolerance & time$V1<=ts))[1]
                  tot = length(time$V1[start:stop])
                  x=sum(color_choice[start:stop] == color_code(colors_csv[i,line]),na.rm=TRUE)
                  learning_curve = c(learning_curve,x/tot)
                }
                learning_curves[[count]] = learning_curve
              }
              else{
                values_parameter = c(values_parameter,NA)
                values_first_half_parameter=c(values_first_half_parameter,NA)
                values_second_half_parameter=c(values_second_half_parameter,NA)
                values_parameter_14 = c(values_parameter_14,NA)
                values_parameter_24 = c(values_parameter_24,NA)
                values_parameter_34 = c(values_parameter_34,NA)
                values_parameter_44 = c(values_parameter_44,NA)
                left_handedness = c(left_handedness, NA)
                first_half_left_handedness = c(first_half_left_handedness, NA)
                second_half_left_handedness = c(second_half_left_handedness, NA)
                left_handedness_14 = c(left_handedness_14,NA)
                left_handedness_24 = c(left_handedness_24,NA)
                left_handedness_34 = c(left_handedness_34,NA)
                left_handedness_44 = c(left_handedness_44,NA)
                values_starting_arm = c(values_starting_arm, NA)
                values_starting_color = c(values_starting_color, NA)
                values_parameter_shockArm = c(values_parameter_shockArm,NA)
                values_parameter_left = c(values_parameter_left,NA)
                values_parameter_right = c(values_parameter_right,NA)
                values_activity = c(values_activity, NA)
                values_first_half_activity=c(values_first_half_activity,NA)
                values_second_half_activity=c(values_second_half_activity,NA)
                values_activity_shock = c(values_activity_shock, NA)
                values_activity_noShock = c(values_activity_noShock, NA)
                values_activity_shock_color = c(values_activity_shock_color, NA)
                values_first_half_activity_shock_color=c(values_first_half_activity_shock_color,NA)
                values_second_half_activity_shock_color=c(values_second_half_activity_shock_color,NA)
                values_activity_noShock_color = c(values_activity_noShock_color, NA)
                values_first_half_activity_noShock_color=c(values_first_half_activity_noShock_color,NA)
                values_second_half_activity_noShock_color=c(values_second_half_activity_noShock_color,NA)
                activity_14=c(activity_14,NA)
                activity_24=c(activity_24,NA)
                activity_34=c(activity_34,NA)
                activity_44=c(activity_44,NA)
                activity_shock_color_14 = c(activity_shock_color_14,NA)
                activity_shock_color_24 = c(activity_shock_color_24,NA)
                activity_shock_color_34 = c(activity_shock_color_34,NA)
                activity_shock_color_44 = c(activity_shock_color_44,NA)
                activity_noShock_color_14 = c(activity_noShock_color_14,NA)
                activity_noShock_color_24 = c(activity_noShock_color_24,NA)
                activity_noShock_color_34 = c(activity_noShock_color_34,NA)
                activity_noShock_color_44 = c(activity_noShock_color_44,NA)
                total_choices_arr = c(total_choices_arr,NA)
                correct_choices_arr = c(correct_choices_arr,NA)
                incorrect_choices_arr = c(incorrect_choices_arr,NA)
                first_half_total_choices_arr = c(first_half_total_choices_arr,NA)
                first_half_correct_choices_arr = c(first_half_correct_choices_arr,NA)
                first_half_incorrect_choices_arr = c(first_half_incorrect_choices_arr,NA)
                total_choices_14 = c(total_choices_14,NA)
                correct_choices_14 = c(correct_choices_14,NA)
                incorrect_choices_14 = c(incorrect_choices_14,NA)
                total_choices_24 = c(total_choices_24,NA)
                correct_choices_24 = c(correct_choices_24,NA)
                incorrect_choices_24 = c(incorrect_choices_24,NA)
                total_choices_34 = c(total_choices_34,NA)
                correct_choices_34 = c(correct_choices_34,NA)
                incorrect_choices_34 = c(incorrect_choices_34,NA)
                total_choices_44 = c(total_choices_44,NA)
                correct_choices_44 = c(correct_choices_44,NA)
                incorrect_choices_44 = c(incorrect_choices_44,NA)
                maxTime_arr = c(maxTime_arr,NA)
                learning_curves[[count]] = NA
                decisions[[count]] = NA
                activity_curves[[count]] = NA
                activity_curves_shock[[count]] = NA
                activity_curves_noShock[[count]] = NA
              }
              # poltu=plot_ly(x=track$V1,y=box_height-track$V2,z=time$V1,mode='lines')
              # saveWidget(poltu, paste0(path,folder,"/",date,"/traces/",exp,"/traces_",i,".html"), selfcontained = F, libdir = "lib")
            }
            else{
              values_parameter = c(values_parameter,NA)
              values_first_half_parameter=c(values_first_half_parameter,NA)
              values_second_half_parameter=c(values_second_half_parameter,NA)
              values_parameter_14 = c(values_parameter_14,NA)
              values_parameter_24 = c(values_parameter_24,NA)
              values_parameter_34 = c(values_parameter_34,NA)
              values_parameter_44 = c(values_parameter_44,NA)
              left_handedness = c(left_handedness, NA)
              first_half_left_handedness = c(first_half_left_handedness, NA)
              second_half_left_handedness = c(second_half_left_handedness, NA)
              left_handedness_14 = c(left_handedness_14,NA)
              left_handedness_24 = c(left_handedness_24,NA)
              left_handedness_34 = c(left_handedness_34,NA)
              left_handedness_44 = c(left_handedness_44,NA)
              values_starting_arm = c(values_starting_arm, NA)
              values_starting_color = c(values_starting_color, NA)
              values_parameter_shockArm = c(values_parameter_shockArm,NA)
              values_parameter_left = c(values_parameter_left,NA)
              values_parameter_right = c(values_parameter_right,NA)
              values_activity = c(values_activity, NA)
              values_first_half_activity=c(values_first_half_activity,NA)
              values_second_half_activity=c(values_second_half_activity,NA)
              values_activity_shock = c(values_activity_shock, NA)
              values_activity_noShock = c(values_activity_noShock, NA)
              values_activity_shock_color = c(values_activity_shock_color, NA)
              values_first_half_activity_shock_color=c(values_first_half_activity_shock_color,NA)
              values_second_half_activity_shock_color=c(values_second_half_activity_shock_color,NA)
              values_activity_noShock_color = c(values_activity_noShock_color, NA)
              values_first_half_activity_noShock_color=c(values_first_half_activity_noShock_color,NA)
              values_second_half_activity_noShock_color=c(values_second_half_activity_noShock_color,NA)
              activity_14=c(activity_14,NA)
              activity_24=c(activity_24,NA)
              activity_34=c(activity_34,NA)
              activity_44=c(activity_44,NA)
              activity_shock_color_14 = c(activity_shock_color_14,NA)
              activity_shock_color_24 = c(activity_shock_color_24,NA)
              activity_shock_color_34 = c(activity_shock_color_34,NA)
              activity_shock_color_44 = c(activity_shock_color_44,NA)
              activity_noShock_color_14 = c(activity_noShock_color_14,NA)
              activity_noShock_color_24 = c(activity_noShock_color_24,NA)
              activity_noShock_color_34 = c(activity_noShock_color_34,NA)
              activity_noShock_color_44 = c(activity_noShock_color_44,NA)
              total_choices_arr = c(total_choices_arr,NA)
              correct_choices_arr = c(correct_choices_arr,NA)
              incorrect_choices_arr = c(incorrect_choices_arr,NA)
              first_half_total_choices_arr = c(first_half_total_choices_arr,NA)
              first_half_correct_choices_arr = c(first_half_correct_choices_arr,NA)
              first_half_incorrect_choices_arr = c(first_half_incorrect_choices_arr,NA)
              total_choices_14 = c(total_choices_14,NA)
              correct_choices_14 = c(correct_choices_14,NA)
              incorrect_choices_14 = c(incorrect_choices_14,NA)
              total_choices_24 = c(total_choices_24,NA)
              correct_choices_24 = c(correct_choices_24,NA)
              incorrect_choices_24 = c(incorrect_choices_24,NA)
              total_choices_34 = c(total_choices_34,NA)
              correct_choices_34 = c(correct_choices_34,NA)
              incorrect_choices_34 = c(incorrect_choices_34,NA)
              total_choices_44 = c(total_choices_44,NA)
              correct_choices_44 = c(correct_choices_44,NA)
              incorrect_choices_44 = c(incorrect_choices_44,NA)
              maxTime_arr = c(maxTime_arr,NA)
              learning_curves[[count]] = NA
              decisions[[count]] = NA
              activity_curves[[count]] = NA
              activity_curves_shock[[count]] = NA
              activity_curves_noShock[[count]] = NA
            }
            
            bias_track = try(read.csv(paste0("bias_estimation_track_",i,".csv"),header=FALSE),silent=TRUE)
            bias_index = try(which(bias_track$V1 > -1),silent=TRUE)
            if(class(bias_track) != "try-error" && length(bias_index)>0){
              bias_present = TRUE
              track = bias_track
              index = bias_index
              time = try(read.csv(paste0("bias_estimation_time_",i,".csv"),header=FALSE))
              shock = try(read.csv(paste0("bias_estimation_shock_",i,".csv"),header=FALSE))
              pattern = try(read.csv(paste0("bias_estimation_pattern_",i,".csv"),header=FALSE))
              truncated_time = try(read.csv(paste0("bias_estimation_truncated_time_",i,".csv"),header = FALSE))
              if(class(truncated_time)=='try-error'){
                truncated_time = data.frame(V1=0)
              }
              cummulative_scores = try(read.csv(paste0("bias_estimation_cummulative_scores_",i,".csv"),header=FALSE))
              
              track = track[index,]
              track = calibrate(track)
              index = which(track$V1  > -1 & track$V2  > -1)
              rownames(track) = NULL

              arm = data.frame(V1=rep('X',length(track$V1)))
              arm$V1[which(track$V2 < y_mid - len_mid)] = 'M'
              arm$V1[which((track$V2 >= y_mid - len_mid) & (track$V1 < x_mid - len_mid*cos(pi/6)))] = 'L'
              arm$V1[which((track$V2 >= y_mid - len_mid) & (track$V1 > x_mid + len_mid*cos(pi/6)))] = 'R'


              time = data.frame(V1 = time[index,])
              rownames(time) = NULL

              shock= data.frame(V1 = shock[index,])
              rownames(shock) = NULL

              pattern= data.frame(V1 = pattern[index,])
              rownames(pattern) = NULL
              
              color_choice = str_sub(pattern$V1,lapply(arm$V1, get_index_from_arm),lapply(arm$V1, get_index_from_arm))
              
              track_shock = track
              track_shock[shock$V1 == "O",] = c(NA, NA)
              track_noShock = track
              track_noShock[shock$V1 == "X",] = c(NA, NA)
              track_shock_color = track[color_choice == color_code(colors_csv[i,line]),]
              rownames(track_shock_color) = NULL
              track_noShock_color = track[color_choice != color_code(colors_csv[i,line]),]
              rownames(track_noShock_color) = NULL
              
              # setting start time to 0
              time$V1 = time$V1 - time$V1[1] # because time is calculated right from the beginning
              time$V1=time$V1/1000000000
              time$V1[length(time$V1)] = ceiling(time$V1[length(time$V1)])
              
              truncated_time$V1 = truncated_time$V1 - time$V1[1]
              truncated_time$V1=truncated_time$V1/1000000000
              
              #for analysis of frac_time_on_shocked
              minTimeSec = 0
              maxTimeSec = 600
              stop_index = rev(which(time$V1>maxTimeSec-time_tolerance & time$V1<=maxTimeSec))[1]
              truncated_stop_index = which(truncated_time$V1>=maxTimeSec)[1]
              if(is.na(stop_index)){
                maxTimeSec = 180
                stop_index = rev(which(time$V1>maxTimeSec-time_tolerance & time$V1<=maxTimeSec))[1]
                truncated_stop_index = which(truncated_time$V1>=maxTimeSec)[1]
              }
              start_index = which(time$V1>=minTimeSec)[1]
              
              
              
              
              if(!is.na(stop_index)){
                bias_maxTime_arr = c(bias_maxTime_arr,maxTimeSec)
                # decision scores
                if(!is.na(truncated_stop_index)){
                  bias_total_choices_arr = c(bias_total_choices_arr,cummulative_scores$V1[truncated_stop_index])
                  bias_correct_choices_arr = c(bias_correct_choices_arr,cummulative_scores$V2[truncated_stop_index])
                  bias_incorrect_choices_arr = c(bias_incorrect_choices_arr,cummulative_scores$V3[truncated_stop_index])
                }
                else{
                  bias_total_choices_arr = c(bias_total_choices_arr,tail(cummulative_scores$V1,n=1))
                  bias_correct_choices_arr = c(bias_correct_choices_arr,tail(cummulative_scores$V2,n=1))
                  bias_incorrect_choices_arr = c(bias_incorrect_choices_arr,tail(cummulative_scores$V3,n=1))
                }
                
                t = length(time$V1[start_index:stop_index])
                frame_rate = as.integer(t/(maxTimeSec - minTimeSec)) # framerate
                activity_seconds_unit = 1.0

                x=sum(color_choice[start_index:stop_index] == color_code(colors_csv[i,line]),na.rm=TRUE)
                parameter = x/t
                bias_values_parameter = c(bias_values_parameter,parameter)
                
                tr_arm=arm$V1[start_index:stop_index][arm$V1[start_index:stop_index]!=c(arm$V1[start_index:stop_index][-1], FALSE)]
                tr_arm = tr_arm[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                bias_left_handedness = c(bias_left_handedness, mean(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns),na.rm=TRUE))
                
                # activity
                bias_values_activity = c(bias_values_activity, get_activity_from_track(track[start_index:stop_index,],frame_rate,activity_seconds_unit))
                bias_activity_curves[[count]] = global_array
                bias_values_activity_shock = c(bias_values_activity_shock, get_activity_from_track(track_shock[start_index:stop_index,],frame_rate,activity_seconds_unit))
                bias_values_activity_noShock = c(bias_values_activity_noShock, get_activity_from_track(track_noShock[start_index:stop_index,],frame_rate,activity_seconds_unit))
                bias_values_activity_shock_color = c(bias_values_activity_shock_color, get_activity_from_track(track_shock_color[start_index:stop_index,],frame_rate,activity_seconds_unit))
                bias_values_activity_noShock_color = c(bias_values_activity_noShock_color, get_activity_from_track(track_noShock_color[start_index:stop_index,],frame_rate,activity_seconds_unit))
                
                #learning curves
                start_time = 0
                stop_time = maxTimeSec
                time_step = timeStep
                times = seq(start_time+time_step,stop_time,time_step)
                start = which(time$V1>=start_time)[1]
                learning_curve = c()
                for(ts in times){
                  stop = rev(which(time$V1>ts-time_tolerance & time$V1<=ts))[1]
                  tot = length(time$V1[start:stop])
                  x=sum(color_choice[start:stop] == color_code(colors_csv[i,line]),na.rm=TRUE)
                  learning_curve = c(learning_curve,x/tot)
                }
                bias_learning_curves[[count]] = learning_curve
              }
              else{
                bias_values_parameter = c(bias_values_parameter,NA)
                bias_left_handedness = c(bias_left_handedness, NA)
                bias_values_activity = c(bias_values_activity, NA)
                bias_values_activity_shock = c(bias_values_activity_shock, NA)
                bias_values_activity_noShock = c(bias_values_activity_noShock, NA)
                bias_values_activity_shock_color = c(bias_values_activity_shock_color, NA)
                bias_values_activity_noShock_color = c(bias_values_activity_noShock_color, NA)
                bias_total_choices_arr = c(bias_total_choices_arr,NA)
                bias_correct_choices_arr = c(bias_correct_choices_arr,NA)
                bias_incorrect_choices_arr = c(bias_incorrect_choices_arr,NA)
                bias_maxTime_arr = c(bias_maxTime_arr,NA)
                bias_learning_curves[[count]] = NA
                bias_activity_curves[[count]] = NA
              }
              # poltu=plot_ly(x=track$V1,y=box_height-track$V2,z=time$V1,mode='lines')
              # saveWidget(poltu, paste0(path,folder,"/",date,"/traces/",exp,"/traces_",i,".html"), selfcontained = F, libdir = "lib")
            }
            else{
              #add NA to bias scores
              bias_values_parameter = c(bias_values_parameter,NA)
              bias_left_handedness = c(bias_left_handedness, NA)
              bias_values_activity = c(bias_values_activity, NA)
              bias_values_activity_shock = c(bias_values_activity_shock, NA)
              bias_values_activity_noShock = c(bias_values_activity_noShock, NA)
              bias_values_activity_shock_color = c(bias_values_activity_shock_color, NA)
              bias_values_activity_noShock_color = c(bias_values_activity_noShock_color, NA)
              bias_total_choices_arr = c(bias_total_choices_arr,NA)
              bias_correct_choices_arr = c(bias_correct_choices_arr,NA)
              bias_incorrect_choices_arr = c(bias_incorrect_choices_arr,NA)
              bias_maxTime_arr = c(bias_maxTime_arr,NA)
              bias_learning_curves[[count]] = NA
              bias_activity_curves[[count]] = NA
            }
            
            post_track = try(read.csv(paste0("post_assay_track_",i,".csv"),header=FALSE),silent=TRUE)
            post_index = try(which(post_track$V1 > -1),silent=TRUE)
            if(class(post_track) != "try-error" && length(post_index)>0){
              post_present = TRUE
              track = post_track
              index = post_index
              time = try(read.csv(paste0("post_assay_time_",i,".csv"),header=FALSE))
              shock = try(read.csv(paste0("post_assay_shock_",i,".csv"),header=FALSE))
              pattern = try(read.csv(paste0("post_assay_pattern_",i,".csv"),header=FALSE))
              truncated_time = try(read.csv(paste0("post_assay_truncated_time_",i,".csv"),header = FALSE))
              if(class(truncated_time)=='try-error'){
                truncated_time = data.frame(V1=0)
              }
              cummulative_scores = try(read.csv(paste0("post_assay_cummulative_scores_",i,".csv"),header=FALSE))
              
              track = track[index,]
              track = calibrate(track)
              index = which(track$V1  > -1 & track$V2  > -1)
              rownames(track) = NULL

              arm = data.frame(V1=rep('X',length(track$V1)))
              arm$V1[which(track$V2 < y_mid - len_mid)] = 'M'
              arm$V1[which((track$V2 >= y_mid - len_mid) & (track$V1 < x_mid - len_mid*cos(pi/6)))] = 'L'
              arm$V1[which((track$V2 >= y_mid - len_mid) & (track$V1 > x_mid + len_mid*cos(pi/6)))] = 'R'


              time = data.frame(V1 = time[index,])
              rownames(time) = NULL

              shock= data.frame(V1 = shock[index,])
              rownames(shock) = NULL

              pattern= data.frame(V1 = pattern[index,])
              rownames(pattern) = NULL
              
              color_choice = str_sub(pattern$V1,lapply(arm$V1, get_index_from_arm),lapply(arm$V1, get_index_from_arm))
              
              track_shock = track
              track_shock[shock$V1 == "O",] = c(NA, NA)
              track_noShock = track
              track_noShock[shock$V1 == "X",] = c(NA, NA)
              track_shock_color = track[color_choice == color_code(colors_csv[i,line]),]
              rownames(track_shock_color) = NULL
              track_noShock_color = track[color_choice != color_code(colors_csv[i,line]),]
              rownames(track_noShock_color) = NULL
              
              # setting start time to 0
              time$V1 = time$V1 - time$V1[1] # because time is calculated right from the beginning
              time$V1=time$V1/1000000000
              time$V1[length(time$V1)] = ceiling(time$V1[length(time$V1)])
              
              truncated_time$V1 = truncated_time$V1 - time$V1[1]
              truncated_time$V1=truncated_time$V1/1000000000
              
              #for analysis of frac_time_on_shocked
              minTimeSec = 0
              maxTimeSec = 600
              stop_index = rev(which(time$V1>maxTimeSec-time_tolerance & time$V1<=maxTimeSec))[1]
              truncated_stop_index = which(truncated_time$V1>=maxTimeSec)[1]
              half_stop_index = rev(which(time$V1>maxTimeSec/2-time_tolerance & time$V1<=maxTimeSec/2))[1]
              truncated_half_stop_index = which(truncated_time$V1>=maxTimeSec/2)[1]
              start_index = which(time$V1>=minTimeSec)[1]
              
              
              
              
              if(!is.na(stop_index)){
                post_maxTime_arr = c(post_maxTime_arr,maxTimeSec)
                # decision scores
                if(!is.na(truncated_stop_index)){
                  post_total_choices_arr = c(post_total_choices_arr,cummulative_scores$V1[truncated_stop_index])
                  post_correct_choices_arr = c(post_correct_choices_arr,cummulative_scores$V2[truncated_stop_index])
                  post_incorrect_choices_arr = c(post_incorrect_choices_arr,cummulative_scores$V3[truncated_stop_index])
                  
                  post_first_half_total_choices_arr = c(post_first_half_total_choices_arr,cummulative_scores$V1[truncated_half_stop_index])
                  post_first_half_correct_choices_arr = c(post_first_half_correct_choices_arr,cummulative_scores$V2[truncated_half_stop_index])
                  post_first_half_incorrect_choices_arr = c(post_first_half_incorrect_choices_arr,cummulative_scores$V3[truncated_half_stop_index])
                }
                else{
                  post_total_choices_arr = c(post_total_choices_arr,tail(cummulative_scores$V1,n=1))
                  post_correct_choices_arr = c(post_correct_choices_arr,tail(cummulative_scores$V2,n=1))
                  post_incorrect_choices_arr = c(post_incorrect_choices_arr,tail(cummulative_scores$V3,n=1))
                  
                  post_first_half_total_choices_arr = c(post_first_half_total_choices_arr,cummulative_scores$V1[truncated_half_stop_index])
                  post_first_half_correct_choices_arr = c(post_first_half_correct_choices_arr,cummulative_scores$V2[truncated_half_stop_index])
                  post_first_half_incorrect_choices_arr = c(post_first_half_incorrect_choices_arr,cummulative_scores$V3[truncated_half_stop_index])
                }
                
                t = length(time$V1[start_index:stop_index])
                frame_rate = as.integer(t/(maxTimeSec - minTimeSec)) # framerate
                activity_seconds_unit = 1.0
                
                x=sum(color_choice[start_index:stop_index] == color_code(colors_csv[i,line]),na.rm=TRUE)
                parameter = x/t
                post_values_parameter = c(post_values_parameter,parameter)
                
                tr_arm=arm$V1[start_index:stop_index][arm$V1[start_index:stop_index]!=c(arm$V1[start_index:stop_index][-1], FALSE)]
                tr_arm = tr_arm[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                post_left_handedness = c(post_left_handedness, mean(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns),na.rm=TRUE))
                
                tr_arm=arm$V1[start_index:half_stop_index][arm$V1[start_index:half_stop_index]!=c(arm$V1[start_index:half_stop_index][-1], FALSE)]
                tr_arm = tr_arm[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                post_first_half_left_handedness = c(post_first_half_left_handedness, mean(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns),na.rm=TRUE))
                
                tr_arm=arm$V1[half_stop_index:stop_index][arm$V1[half_stop_index:stop_index]!=c(arm$V1[half_stop_index:stop_index][-1], FALSE)]
                tr_arm = tr_arm[tr_arm!='X']
                tr_arm=tr_arm[tr_arm!=c(tr_arm[-1], FALSE)]
                post_second_half_left_handedness = c(post_second_half_left_handedness, mean(sapply(paste0(tr_arm[-length(tr_arm)],tr_arm[-1]),turns),na.rm=TRUE))
                
                # activity
                post_values_activity = c(post_values_activity, get_activity_from_track(track[start_index:stop_index,],frame_rate,activity_seconds_unit))
                post_activity_curves[[count]] = global_array
                post_values_activity_shock = c(post_values_activity_shock, get_activity_from_track(track_shock[start_index:stop_index,],frame_rate,activity_seconds_unit))
                post_values_activity_noShock = c(post_values_activity_noShock, get_activity_from_track(track_noShock[start_index:stop_index,],frame_rate,activity_seconds_unit))
                post_values_activity_shock_color = c(post_values_activity_shock_color, get_activity_from_track(track_shock_color[start_index:stop_index,],frame_rate,activity_seconds_unit))
                post_values_activity_noShock_color = c(post_values_activity_noShock_color, get_activity_from_track(track_noShock_color[start_index:stop_index,],frame_rate,activity_seconds_unit))
                
                #learning curves
                start_time = 0
                stop_time = maxTimeSec
                time_step = timeStep
                times = seq(start_time+time_step,stop_time,time_step)
                start = which(time$V1>=start_time)[1]
                learning_curve = c()
                for(ts in times){
                  stop = rev(which(time$V1>ts-time_tolerance & time$V1<=ts))[1]
                  tot = length(time$V1[start:stop])
                  x=sum(color_choice[start:stop] == color_code(colors_csv[i,line]),na.rm=TRUE)
                  learning_curve = c(learning_curve,x/tot)
                }
                post_learning_curves[[count]] = learning_curve
              }
              else{
                post_values_parameter = c(post_values_parameter,NA)
                post_left_handedness = c(post_left_handedness, NA)
                post_first_half_left_handedness = c(post_first_half_left_handedness, NA)
                post_second_half_left_handedness = c(post_second_half_left_handedness, NA)
                post_values_activity = c(post_values_activity, NA)
                post_values_activity_shock = c(post_values_activity_shock, NA)
                post_values_activity_noShock = c(post_values_activity_noShock, NA)
                post_values_activity_shock_color = c(post_values_activity_shock_color, NA)
                post_values_activity_noShock_color = c(post_values_activity_noShock_color, NA)
                post_total_choices_arr = c(post_total_choices_arr,NA)
                post_correct_choices_arr = c(post_correct_choices_arr,NA)
                post_incorrect_choices_arr = c(post_incorrect_choices_arr,NA)
                post_first_half_total_choices_arr = c(post_first_half_total_choices_arr,NA)
                post_first_half_correct_choices_arr = c(post_first_half_correct_choices_arr,NA)
                post_first_half_incorrect_choices_arr = c(post_first_half_incorrect_choices_arr,NA)
                post_maxTime_arr = c(post_maxTime_arr,NA)
                post_learning_curves[[count]] = NA
                post_activity_curves[[count]] = NA
              }
              # poltu=plot_ly(x=track$V1,y=box_height-track$V2,z=time$V1,mode='lines')
              # saveWidget(poltu, paste0(path,folder,"/",date,"/traces/",exp,"/traces_",i,".html"), selfcontained = F, libdir = "lib")
            }
            else{
              #add NA to post scores
              post_values_parameter = c(post_values_parameter,NA)
              post_left_handedness = c(post_left_handedness, NA)
              post_first_half_left_handedness = c(post_first_half_left_handedness, NA)
              post_second_half_left_handedness = c(post_second_half_left_handedness, NA)
              post_values_activity = c(post_values_activity, NA)
              post_values_activity_shock = c(post_values_activity_shock, NA)
              post_values_activity_noShock = c(post_values_activity_noShock, NA)
              post_values_activity_shock_color = c(post_values_activity_shock_color, NA)
              post_values_activity_noShock_color = c(post_values_activity_noShock_color, NA)
              post_total_choices_arr = c(post_total_choices_arr,NA)
              post_correct_choices_arr = c(post_correct_choices_arr,NA)
              post_incorrect_choices_arr = c(post_incorrect_choices_arr,NA)
              post_first_half_total_choices_arr = c(post_first_half_total_choices_arr,NA)
              post_first_half_correct_choices_arr = c(post_first_half_correct_choices_arr,NA)
              post_first_half_incorrect_choices_arr = c(post_first_half_incorrect_choices_arr,NA)
              post_maxTime_arr = c(post_maxTime_arr,NA)
              post_learning_curves[[count]] = NA
              post_activity_curves[[count]] = NA
            }
            
            if(bias_present && main_present && post_present){
              #learning curves
              main_track = try(read.csv(paste0("track_",i,".csv"),header=FALSE))
              main_time = try(read.csv(paste0("time_",i,".csv"),header=FALSE))
              main_pattern = try(read.csv(paste0("pattern_",i,".csv"),header=FALSE))
              main_index = which(main_track$V1  > -1 & main_track$V2  > -1)
              main_track = main_track[main_index,]
              main_track = calibrate(main_track)
              main_index = which(main_track$V1  > -1 & main_track$V2  > -1)
              main_track = main_track[main_index,]
              rownames(main_track) = NULL
              main_time = data.frame(V1 = main_time[main_index,])
              rownames(main_time) = NULL
              main_pattern = data.frame(V1 = main_pattern[main_index,])
              rownames(main_pattern) = NULL

              bias_track = try(read.csv(paste0("bias_estimation_track_",i,".csv"),header=FALSE))
              bias_time = try(read.csv(paste0("bias_estimation_time_",i,".csv"),header=FALSE))
              bias_pattern = try(read.csv(paste0("bias_estimation_pattern_",i,".csv"),header=FALSE))
              bias_index = which(bias_track$V1  > -1 & bias_track$V2  > -1)
              bias_track = bias_track[bias_index,]
              bias_track = calibrate(bias_track)
              bias_index = which(bias_track$V1  > -1 & bias_track$V2  > -1)
              bias_track = bias_track[bias_index,]
              rownames(bias_track) = NULL
              bias_time = data.frame(V1 = bias_time[bias_index,])
              rownames(bias_time) = NULL
              bias_pattern = data.frame(V1 = bias_pattern[bias_index,])
              rownames(bias_pattern) = NULL

              post_track = try(read.csv(paste0("post_assay_track_",i,".csv"),header=FALSE))
              post_time = try(read.csv(paste0("post_assay_time_",i,".csv"),header=FALSE))
              post_pattern = try(read.csv(paste0("post_assay_pattern_",i,".csv"),header=FALSE))
              post_index = which(post_track$V1  > -1 & post_track$V2  > -1)
              post_track = post_track[post_index,]
              post_track = calibrate(post_track)
              post_index = which(post_track$V1  > -1 & post_track$V2  > -1)
              post_track = post_track[post_index,]
              rownames(post_track) = NULL
              post_time = data.frame(V1 = post_time[post_index,])
              rownames(post_time) = NULL
              post_pattern = data.frame(V1 = post_pattern[post_index,])
              rownames(post_pattern) = NULL
              
              main_time$V1 = main_time$V1 - main_time$V1[1] # because time is calculated right from the beginning
              main_time$V1=main_time$V1/1000000000
              main_time$V1[length(main_time$V1)] = ceiling(main_time$V1[length(main_time$V1)])
              
              bias_time$V1 = bias_time$V1 - bias_time$V1[1] # because time is calculated right from the beginning
              bias_time$V1=bias_time$V1/1000000000
              bias_time$V1[length(bias_time$V1)] = ceiling(bias_time$V1[length(bias_time$V1)])
              
              post_time$V1 = post_time$V1 - post_time$V1[1] # because time is calculated right from the beginning
              post_time$V1=post_time$V1/1000000000
              post_time$V1[length(post_time$V1)] = ceiling(post_time$V1[length(post_time$V1)])

              main_time$V1 = main_time$V1 + max(bias_time$V1)
              post_time$V1 = post_time$V1 + max(main_time$V1)

              track = data.frame(V1 = c(bias_track$V1, main_track$V1, post_track$V1), V2 = c(bias_track$V2, main_track$V2, post_track$V2))
              time = data.frame(V1 = c(bias_time$V1, main_time$V1, post_time$V1))
              pattern = data.frame(V1 = c(bias_pattern$V1, main_pattern$V1, post_pattern$V1))


              arm = data.frame(V1=rep('X',length(track$V1)))
              arm$V1[which(track$V2 < y_mid - len_mid)] = 'M'
              arm$V1[which((track$V2 >= y_mid - len_mid) & (track$V1 < x_mid - len_mid*cos(pi/6)))] = 'L'
              arm$V1[which((track$V2 >= y_mid - len_mid) & (track$V1 > x_mid + len_mid*cos(pi/6)))] = 'R'
              color_choice = str_sub(pattern$V1,lapply(arm$V1, get_index_from_arm),lapply(arm$V1, get_index_from_arm))
              

              start_time = 0
              stop_time = 600 + 900 + 600
              time_step = timeStep
              times = seq(start_time+time_step,stop_time,time_step)
              start = which(time$V1>=start_time)[1]
              learning_curve = c()
              for(ts in times){
                stop = rev(which(time$V1>ts-time_tolerance & time$V1<=ts))[1]
                if(is.na(stop) || is.na(start)) break;
                tot = length(time$V1[start:stop])
                x=sum(color_choice[start:stop] == color_code(colors_csv[i,line]),na.rm=TRUE)
                learning_curve = c(learning_curve,x/tot)
              }
              overall_learning_curves[[count]] = learning_curve
            }
            else if(bias_present && main_present){
              #learning curves
              main_track = try(read.csv(paste0("track_",i,".csv"),header=FALSE))
              main_time = try(read.csv(paste0("time_",i,".csv"),header=FALSE))
              main_pattern = try(read.csv(paste0("pattern_",i,".csv"),header=FALSE))
              main_index = which(main_track$V1  > -1 & main_track$V2  > -1)
              main_track = main_track[main_index,]
              main_track = calibrate(main_track)
              main_index = which(main_track$V1  > -1 & main_track$V2  > -1)
              main_track = main_track[main_index,]
              rownames(main_track) = NULL
              main_time = data.frame(V1 = main_time[main_index,])
              rownames(main_time) = NULL
              main_pattern = data.frame(V1 = main_pattern[main_index,])
              rownames(main_pattern) = NULL

              bias_track = try(read.csv(paste0("bias_estimation_track_",i,".csv"),header=FALSE))
              bias_time = try(read.csv(paste0("bias_estimation_time_",i,".csv"),header=FALSE))
              bias_pattern = try(read.csv(paste0("bias_estimation_pattern_",i,".csv"),header=FALSE))
              bias_index = which(bias_track$V1  > -1 & bias_track$V2  > -1)
              bias_track = bias_track[bias_index,]
              bias_track = calibrate(bias_track)
              bias_index = which(bias_track$V1  > -1 & bias_track$V2  > -1)
              bias_track = bias_track[bias_index,]
              rownames(bias_track) = NULL
              bias_time = data.frame(V1 = bias_time[bias_index,])
              rownames(bias_time) = NULL
              bias_pattern = data.frame(V1 = bias_pattern[bias_index,])
              rownames(bias_pattern) = NULL
              
              main_time$V1 = main_time$V1 - main_time$V1[1] # because time is calculated right from the beginning
              main_time$V1=main_time$V1/1000000000
              main_time$V1[length(main_time$V1)] = ceiling(main_time$V1[length(main_time$V1)])
              
              bias_time$V1 = bias_time$V1 - bias_time$V1[1] # because time is calculated right from the beginning
              bias_time$V1=bias_time$V1/1000000000
              bias_time$V1[length(bias_time$V1)] = ceiling(bias_time$V1[length(bias_time$V1)])

              main_time$V1 = main_time$V1 + max(bias_time$V1)

              track = data.frame(V1 = c(bias_track$V1,main_track$V1),
                                 V2 = c(bias_track$V2, main_track$V2))
              time = data.frame(V1 = c(bias_time$V1, main_time$V1))
              pattern = data.frame(V1 = c(bias_pattern$V1, main_pattern$V1))


              arm = data.frame(V1=rep('X',length(track$V1)))
              arm$V1[which(track$V2 < y_mid - len_mid)] = 'M'
              arm$V1[which((track$V2 >= y_mid - len_mid) & (track$V1 < x_mid - len_mid*cos(pi/6)))] = 'L'
              arm$V1[which((track$V2 >= y_mid - len_mid) & (track$V1 > x_mid + len_mid*cos(pi/6)))] = 'R'
              color_choice = str_sub(pattern$V1,lapply(arm$V1, get_index_from_arm),lapply(arm$V1, get_index_from_arm))
              

              start_time = 0
              stop_time = 180 + 1200
              time_step = timeStep
              times = seq(start_time+time_step,stop_time,time_step)
              start = which(time$V1>=start_time)[1]
              learning_curve = c()
              for(ts in times){
                stop = rev(which(time$V1>ts-time_tolerance & time$V1<=ts))[1]
                if(is.na(stop) || is.na(start)) break;
                tot = length(time$V1[start:stop])
                x=sum(color_choice[start:stop] == color_code(colors_csv[i,line]),na.rm=TRUE)
                learning_curve = c(learning_curve,x/tot)
              }
              overall_learning_curves[[count]] = learning_curve
            }
            else if(main_present && post_present){
              overall_learning_curves[[count]] = NA
            }
            else{
              overall_learning_curves[[count]] = NA
            }
            
            print(count)
            count=count+1
          }
        }
        setwd("..")
      }
      setwd("..")
    }
    setwd("..")
    setwd('..')
  }
  setwd('..')
}

df = data.frame(id=index_list,
                genotype = genotype_arr,
                sex = sex_arr,
                exp_type = exp_type_arr,
                shock_color = color_arr,
                shock_arm = shock_arm_arr,
                treatment = treatment_arr,
                replicates = reps,
                ZT0 = ZT0s,
                ZT = ZTs,
                starting_arm = values_starting_arm,
                starting_color = values_starting_color,
                frac_time_on_shocked = values_parameter,
                first_half_frac_time_on_shocked = values_first_half_parameter,
                second_half_frac_time_on_shocked = values_second_half_parameter,
                frac_14 = values_parameter_14,
                frac_24 = values_parameter_24,
                frac_34 = values_parameter_34,
                frac_44 = values_parameter_44,
                frac_time_on_shockArm = values_parameter_shockArm,
                frac_time_on_neutral_left = values_parameter_left,
                frac_time_on_neutral_right = values_parameter_right,
                left_handedness = left_handedness,
                first_half_left_handedness = first_half_left_handedness,
                second_half_left_handedness = second_half_left_handedness,
                left_handedness_14 = left_handedness_14,
                left_handedness_24 = left_handedness_24,
                left_handedness_34 = left_handedness_34,
                left_handedness_44 = left_handedness_44,
                activity = values_activity,
                first_half_activity = values_first_half_activity,
                second_half_activity = values_second_half_activity,
                activity_shock = values_activity_shock,
                activity_noShock = values_activity_noShock,
                activity_shock_color = values_activity_shock_color,
                first_half_activity_shock_color = values_first_half_activity_shock_color,
                second_half_activity_shock_color = values_second_half_activity_shock_color,
                activity_noShock_color = values_activity_noShock_color,
                first_half_activity_noShock_color = values_first_half_activity_noShock_color,
                second_half_activity_noShock_color = values_second_half_activity_noShock_color,
                activity_14=activity_14,
                activity_24=activity_24,
                activity_34=activity_34,
                activity_44=activity_44,
                activity_shock_color_14 = activity_shock_color_14,
                activity_shock_color_24 = activity_shock_color_24,
                activity_shock_color_34 = activity_shock_color_34,
                activity_shock_color_44 = activity_shock_color_44,
                activity_noShock_color_14 = activity_noShock_color_14,
                activity_noShock_color_24 = activity_noShock_color_24,
                activity_noShock_color_34 = activity_noShock_color_34,
                activity_noShock_color_44 = activity_noShock_color_44,
                total_choices = total_choices_arr,
                correct_choices = correct_choices_arr,
                incorrect_choices = incorrect_choices_arr,
                first_half_total_choices = first_half_total_choices_arr,
                first_half_correct_choices = first_half_correct_choices_arr,
                first_half_incorrect_choices = first_half_incorrect_choices_arr,
                total_choices_14 = total_choices_14,
                correct_choices_14 = correct_choices_14,
                incorrect_choices_14 = incorrect_choices_14,
                total_choices_24 = total_choices_24,
                correct_choices_24 = correct_choices_24,
                incorrect_choices_24 = incorrect_choices_24,
                total_choices_34 = total_choices_34,
                correct_choices_34 = correct_choices_34,
                incorrect_choices_34 = incorrect_choices_34,
                total_choices_44 = total_choices_44,
                correct_choices_44 = correct_choices_44,
                incorrect_choices_44 = incorrect_choices_44,
                analysis_time = maxTime_arr,
                bias_frac_time_on_shocked = bias_values_parameter,
                bias_left_handedness = bias_left_handedness,
                bias_activity = bias_values_activity,
                bias_activity_shock = bias_values_activity_shock,
                bias_activity_noShock = bias_values_activity_noShock,
                bias_activity_shock_color = bias_values_activity_shock_color,
                bias_activity_noShock_color = bias_values_activity_noShock_color,
                bias_total_choices = bias_total_choices_arr,
                bias_correct_choices = bias_correct_choices_arr,
                bias_incorrect_choices = bias_incorrect_choices_arr,
                bias_analysis_time = bias_maxTime_arr,
                post_frac_time_on_shocked = post_values_parameter,
                post_left_handedness = post_left_handedness,
                post_first_half_left_handedness = post_first_half_left_handedness,
                post_second_half_left_handedness = post_second_half_left_handedness,
                post_activity = post_values_activity,
                post_activity_shock = post_values_activity_shock,
                post_activity_noShock = post_values_activity_noShock,
                post_activity_shock_color = post_values_activity_shock_color,
                post_activity_noShock_color = post_values_activity_noShock_color,
                post_total_choices = post_total_choices_arr,
                post_correct_choices = post_correct_choices_arr,
                post_incorrect_choices = post_incorrect_choices_arr,
                post_first_half_total_choices = post_first_half_total_choices_arr,
                post_first_half_correct_choices = post_first_half_correct_choices_arr,
                post_first_half_incorrect_choices = post_first_half_incorrect_choices_arr,
                post_analysis_time = post_maxTime_arr,
                group = gr,
                group_sex = gr_sex,
                folder = folder,
                experiment_date = date_arr
                )

df$second_half_total_choices =df$total_choices - df$first_half_total_choices
df$second_half_correct_choices = df$correct_choices - df$first_half_correct_choices
df$second_half_incorrect_choices = df$incorrect_choices - df$first_half_incorrect_choices

df$post_second_half_total_choices =df$post_total_choices - df$post_first_half_total_choices
df$post_second_half_correct_choices = df$post_correct_choices - df$post_first_half_correct_choices
df$post_second_half_incorrect_choices = df$post_incorrect_choices - df$post_first_half_incorrect_choices

df$experiment_by = rep('riddha',length(df$id)) #ana:20230910 place blue #yumi: 20230912 place green
df[df$experiment_date == '20230910' & df$exp_type == 'operant_place' & df$shock_color == 'blue',]$experiment_by = 'ana'
df[df$experiment_date == '20230912' & df$exp_type == 'operant_place' & df$shock_color == 'green',]$experiment_by = 'yumi'

IDs_for_scan <- read_excel("IDs_for_scan.xlsx")
df$head_scanned = rep(FALSE,length(df$id))
for(i in 1:length(IDs_for_scan$id)){
  if(IDs_for_scan[i,]$genotype %in% df$genotype && IDs_for_scan[i,]$experiment_date %in% df$experiment_date && IDs_for_scan[i,]$experiment_by %in% df$experiment_by){
    df[df$genotype == IDs_for_scan[i,]$genotype & df$sex == IDs_for_scan[i,]$sex & df$id == IDs_for_scan[i,]$id & df$experiment_date == IDs_for_scan[i,]$experiment_date & df$experiment_by == IDs_for_scan[i,]$experiment_by,]$head_scanned = TRUE
  }
}

#20240220 change code later to recalculate absdev filtering for exp date and type, etc.
abs_dev =c()
abs_dev_sex = c()
for(i in 1:length(df$id)){
  abs_dev = c(abs_dev, abs(df[i,]$frac_time_on_shocked - mean(df[df$genotype == df[i,]$genotype & df$treatment == df[i,]$treatment,]$frac_time_on_shocked,na.rm=T)))
  abs_dev_sex = c(abs_dev_sex, abs(df[i,]$frac_time_on_shocked - mean(df[df$genotype==df[i,]$genotype & df$sex == df[i,]$sex & df$treatment == df[i,]$treatment,]$frac_time_on_shocked,na.rm=T)))
}
df$abs_dev = abs_dev
df$abs_dev_sex = abs_dev_sex

df_lc = df
df_lc$decision_seq = decisions
df_lc$lc = learning_curves
df_lc$bias_lc = bias_learning_curves
df_lc$post_lc = post_learning_curves
df_lc$overall_lc = overall_learning_curves
df_lc$ac = activity_curves
df_lc$ac_shock = activity_curves_shock
df_lc$ac_noShock = activity_curves_noShock
df_lc$bias_ac = bias_activity_curves
df_lc$post_ac = post_activity_curves


write.table(df,"summary.csv",sep=",",row.names = FALSE,append = TRUE, col.names = !file.exists("summary.csv"))


if(!file.exists("summary_lc.rds")){
  write_rds(df_lc,"summary_lc.rds")
} else{
  df_lc_old = readRDS("summary_lc.rds")
  df_lc = rbind(df_lc_old,df_lc)
  write_rds(df_lc,"summary_lc.rds")
}

df = read.csv("summary.csv",header = TRUE)
