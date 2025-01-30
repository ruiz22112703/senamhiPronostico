rm(list = ls())
gc();gc();gc()

cat('Para continuar marque "senamhi"')
cb <- "senamhi"#scan(what = character(), nmax = 1, quiet = TRUE)
cbba<-function(cb){
  if(cb=='senamhi'){
    repeat{
      #cat("HOLA SENAMHI, QUE GUSTO SALUDARTE. \n para el pronostico mensual por favor elija una opcion: \n 1. ENE-FEB-MAR: \n 2. FEB-MAR-ABR: \n 3. MAR-ABR-MAY: \n 4. ABR-MAY-JUN: \n 5. MAY-JUN-JUL: \n 6. JUN-JUL-AGO: \n 7. JUL-AGO-SEP: \n 8. AGO-SEP-OCT: \n 9. SEP-OCT-NOV: \n 10. OCT-NOV-DIC: \n 11. NOV-DIC-ENE: \n 12. DIC-ENE-FEB: \n 0. SALIR \n")
      cat("HOLA SENAMHI, QUE GUSTO SALUDARTE  :) \n para el pronostico mensual por favor elija una opcion: \n 1. ENERO: \n 2. FEBRERO: \n 3. MARZO: \n 4. ABRIL: \n 5. MAYO: \n 6. JUNIO: \n 7. JULIO: \n 8. AGOSTO: \n 9. SEPTIEMBRE: \n 10. OCTUBRE: \n 11. NOVIEMBRE: \n 12. DICIEMBRE: \n 0. SALIR \n")
      #num0<-scan(nmax = 1)
      #
      entrada_valida <- FALSE  # Inicializamos una variable para controlar la validez
      while (!entrada_valida) {  # Bucle hasta obtener una entrada válida
        cat("Elija una opcion: ")
        entrada <- tryCatch({
          num0 <- scan(what = numeric(), nmax = 1, quiet = TRUE)
          if (length(num0) == 1) {
            entrada_valida <- TRUE  # Si es numérico, marcamos la entrada como válida
            # Devolvemos el valor
          } else {
            stop("Entrada no válida.")  # Forzamos un error si no es numérico
          }
        }, error = function(e) {
          cat("Por favor, introduce solo números.\n")  # Mensaje de error
          #NA  # Retornamos NA para reintentar
        })
      }
      #
      Aerop<-function(num0){
        dia<-paste(format(ISOdate(2000, 1:12, 1), "%B"),2025)#c("ENE-FEB-MAR:","FEB-MAR-ABR:","MAR-ABR-MAY:","ABR-MAY-JUN:","MAY-JUN-JUL:","JUN-JUL-AGO:","JUL-AGO-SEP:","AGO-SEP-OCT:","SEP-OCT-NOV:","OCT-NOV-DIC:","NOV-DIC-ENE",'DIC-ENE-FEB:')
        if(num0>1&num0<=12){
          cat(paste("Usted eligio el pronostico para el mes de:", '"',dia[num0],'"',"\n"))
          return(55)
        }else{
          return(7)
        }

      }
      num0
      if(num0==0){
        cat("NO SE REALIZO NINGUNA TAREA ");break}
      #if(num0>12){next}
      if(Aerop(num0)==55){break}
      if(Aerop(num0)==7){cat('POR FAVOR VUELVA A INTENTAR...!!!\n Marque un numero de acuerdo a las opciones, gracias...! \n');next}
      #if((num1==8|num1==9))break
    }
  }else{
    break
  }
  return(num0)
}
num1<-cbba(cb=cb)
