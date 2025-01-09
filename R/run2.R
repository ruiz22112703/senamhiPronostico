#

pacman::p_load(tidyverse,terra,raster,sf,tidyterra,ggimage,ragg,glue,ggspatial)
gc();gc()
setwd('./shapes')
bol0<-vect('./Límite Nacional.shp')
#date<-seq(as.Date('1940-01-01'),as.Date('2024-03-01'),by='month')

bol<-vect('./Límite Departamental.shp')
macro<-vect('./Macroregiones.shp')
lagos<-vect('./Lagos y Lagunas.shp')
#plot(lagos)
salares<-vect('./Salares.shp')
#a
#plot(a[[510:519]])
#plot(bol0)
municipios<-vect('./Límite Provincial.shp')
#plot(municipios)
img1<-data.frame(x=-59,y=-10.5,img='./LOGOSENAMHI.png')
img2<-data.frame(x=-59,y=-21.9,img='./LEYENDAMAPA.png')
escala<-data.frame(x=-62,y=-10.5,img='./NORTE.png')
#
setwd(pl)
dist<-0.05
X<-seq(-71,-56,dist)
Y<-seq(-9,-25,-dist)
datosint<-expand.grid(x=X,y=Y)
gridded(datosint)<-~x+y
a2<-rast(datosint)
for (j in 1:length(lis)) {
  #
  #--------------
  #
  a<-rast(lis[[j]])
  a<-a*2629440*1000;a[a<= -60]<- -60;a[a>= 120]<- 120
  b<-mask(crop(resample(a,a2),st_as_sf(bol0)),st_as_sf(bol0))

  for (i in num1) {
    e<-b[[i]]
    names(e)<-glue("SENAMHI-BOLIVIA, modelo: {name[j]}, mes: {mes[i]}-2025")
    ggplot()+geom_spatraster(data=e)+theme_bw()+facet_wrap(~lyr)+labs(fill='PROB EN %')+
      theme(legend.position = c(1.1, 0.50),legend.background = element_rect(fill = "white",color='black'),
            legend.key.height = unit (3, 'cm'),
            legend.key.width = unit (2, 'cm'),plot.caption = element_text(size=16, color="black", face="italic")) +
      scale_fill_gradientn(colours = c("red3","brown","yellow","white","beige",
                                       "gray57","turquoise","seagreen4",'darkgreen'),
                           limits=c(-60,120),breaks = seq(-60,120,length.out=12),
                           labels=paste0(c(100,80,60,40,40,60,80,100,40,60,80,100),'%'),na.value = "transparent",
                           guide = guide_colorbar(barwidth = unit(0.5, "cm"),barheight = unit(17, "cm")))+
      guides(fill = guide_legend(title.position = "right",direction = "vertical",
                                 title.theme = element_text(angle = 90, size = 12, colour = "black"),
                                 barheight = unit(1.2, "cm"), barwidth = unit(0.5, "cm"),
                                 title.hjust = 0.5, raster = FALSE,
                                 title = paste('B A J O          ',"          N O R M A L       ","           S O B R E"),reverse = TRUE))+
      labs(title = glue("Pronostico de Precipitaciones con modelo: {name[j]}, mes: {mes[i]}-2025"),x='Longitud',y='Latitud')+
      theme(
        #plot.title = element_text(face = "bold"),  # Título en negrita
        legend.title = element_text(face = "bold"),  # Título de la leyenda en negrita
        legend.text = element_text(face = "bold")   # Texto de la leyenda en negrita
      )+geom_sf(data=municipios,fill=NA,lwd=.2,color='gray')+
      geom_sf(data=lagos,fill='darkblue',lwd=.2,color='darkblue')+
      geom_sf(data=bol0,fill=NA,lwd=.3,color='black')+
      geom_sf(data=macro,fill=NA,lwd=.5,color='black')+
      geom_sf(data=salares,fill='lightblue',lwd=.6,color='blue')+
      geom_image(data=img1,aes(x,y,image=img),size=0.2)+
      geom_image(data=escala,aes(x,y,image=img),size=0.15)+
      annotation_scale(location = "br", width_hint = 0.4) +
      geom_image(data=img2,aes(x,y,image=img),size=0.2)+labs(x='Longitud',y='Latitud',fill='PROB EN %')+
      geom_text(aes(x=-67, y=-23.5,fontface = "bold"),label=expression(paste(Psi," .",'(r,t) - ', '@senamhi.gob.bo & IA')),size=3.5)
    ggsave(glue('{names(e)}.png'), width = 30, height = 20, units = "cm")

  }
}
