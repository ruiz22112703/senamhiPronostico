#
#rm(list = ls())

# names(a)<-date
# date %>% length()
rm(list = ls());gc();gc();gc()
source("https://github.com/ruiz22112703/senamhiPronostico/raw/refs/heads/main/R/run1.R")
run<-sprintf("%.2d", 1:12)
name<-c('Aleman','Americano','Canadiense','Europeo','Frances','Italiano','Japones','Reyno_Unido')
mes<-c('enero','febrero','marzo','abril','mayo','junio','julio','agosto','septiembre','octubre','noviembre','diciembre')

old<-getwd()
dir.create(paste0('Pronostico_','para_',mes[num1],'_2025'))

setwd(paste0('Pronostico_','para_',mes[num1],'_2025'))

dir.create(paste0('DATASET_nc_','_2025'))
dir.create(paste0('MODELOS-IMAGEN','_2025'))
setwd(paste0('DATASET_nc_',"_2025"))
#setwd('/home/nihelruiz/Downloads/')
download.file('https://github.com/ruiz22112703/senamhiPronostico/raw/refs/heads/main/file_nc_enero.zip','forecast.zip')
# getwd()
unzip(paste0('forecast','.zip'))
setwd(paste0('file_nc_',mes[num1]))
#
# #setwd(old)
#
#setwd('/home/nihelruiz/Documents/2024/modelos-forecast/nc/')
lis<-list.files(getwd(),pattern = '.nc',full.names = T)
#j<-1;i<-2
setwd(old)
setwd(paste0('Pronostico_','para_',mes[num1],'_2025'))
setwd(paste0('MODELOS-IMAGEN','_2025'));pl<-getwd()
download.file('https://github.com/ruiz22112703/senamhiPronostico/raw/refs/heads/main/shape.zip','shapes.zip')
unzip(paste0('shapes','.zip'))

source('https://github.com/ruiz22112703/senamhiPronostico/raw/refs/heads/main/R/run2.R')


#
#-chirps
