
	Algoritmo SistemaVentas
		// 1. Arreglo Productos (Catálogo)
		Dimension catIds[10], catNombres[10], catPrecios[10]
		catIds[1]<-1; catNombres[1]<-"Aceite"; catPrecios[1]<-120.50
		catIds[2]<-2; catNombres[2]<-"Arroz"; catPrecios[2]<-130.00
		catIds[3]<-3; catNombres[3]<-"Azucar"; catPrecios[3]<-95.50
		catIds[4]<-4; catNombres[4]<-"Fideos"; catPrecios[4]<-62.00
		catIds[5]<-5; catNombres[5]<-"Leche"; catPrecios[5]<-72.00
		catIds[6]<-6; catNombres[6]<-"Atun"; catPrecios[6]<-250.00
		catIds[7]<-7; catNombres[7]<-"Cafe"; catPrecios[7]<-98.00
		catIds[8]<-8; catNombres[8]<-"Huevos"; catPrecios[8]<-125.00
		catIds[9]<-9; catNombres[9]<-"Lentejas"; catPrecios[9]<-180.00
		catIds[10]<-10; catNombres[10]<-"Papel"; catPrecios[10]<-100.00
		
		// 2. Arreglo Carrito (Capacidad 50)
		Dimension carIds[50], carNombres[50], carCantidades[50], carSubtotales[50]
		totalItems <- 0
		
		continuar <- Verdadero
		
		Mientras continuar Hacer
			Limpiar Pantalla
			Escribir "--- SISTEMA DE VENTAS ---"
			Escribir "1. Ver Catálogo y Comprar"
			Escribir "2. Ver Carrito"
			Escribir "3. Eliminar Producto del Carrito"
			Escribir "4. Pagar y Generar Voucher"
			Escribir "5. Salir"
			Escribir Sin Saltar "Seleccione una opción: "
			Leer opcion
			
			Segun opcion Hacer
				1: // COMPRAR
					Limpiar Pantalla
					Escribir "=== CATÁLOGO DISPONIBLE ==="
					Escribir "ID   Producto        Precio"
					Para i<-1 Hasta 10 Hacer
						Escribir catIds[i], "    ", catNombres[i], "        S/ ", catPrecios[i]
					FinPara
					
					Escribir Sin Saltar "Ingrese el ID del producto: "
					Leer idSel
					encontrado <- Falso
					
					Para i<-1 Hasta 10 Hacer
						Si catIds[i] == idSel Entonces
							Escribir Sin Saltar "¿Qué cantidad de ", catNombres[i], " desea?: "
							Leer cant
							
							totalItems <- totalItems + 1
							carIds[totalItems] <- catIds[i]
							carNombres[totalItems] <- catNombres[i]
							carCantidades[totalItems] <- cant
							carSubtotales[totalItems] <- catPrecios[i] * cant
							
							encontrado <- Verdadero
							Escribir "¡Producto añadido al carrito!"
						FinSi
					FinPara
					Si No encontrado Entonces Escribir "ID no válido."; FinSi
					Escribir "Presione Enter para continuar..."; Leer Tecla
					
				2: // VER CARRITO
					Limpiar Pantalla
					Si totalItems == 0 Entonces
						Escribir "Carrito vacío."
					Sino
						Escribir "ID   Producto        Cant.    Subtotal"
						Para i<-1 Hasta totalItems Hacer
							Escribir carIds[i], "    ", carNombres[i], "        ", carCantidades[i], "    S/ ", carSubtotales[i]
						FinPara
					FinSi
					Escribir "Presione Enter para volver..."; Leer Tecla
					
				3: // ELIMINAR
					Limpiar Pantalla
					Si totalItems == 0 Entonces
						Escribir "El carrito está vacío."
					Sino
						Escribir "=== ELIMINAR PRODUCTO ==="
						// Mostrar actual
						Para i<-1 Hasta totalItems Hacer
							Escribir carIds[i], " - ", carNombres[i]
						FinPara
						Escribir Sin Saltar "Ingrese el ID a quitar: "
						Leer idElim
						eliminado <- Falso
						
						Para i<-1 Hasta totalItems Hacer
							Si carIds[i] == idElim Entonces
								// Desplazamiento a la izquierda
								Para j<-i Hasta totalItems - 1 Hacer
									carIds[j] <- carIds[j+1]
									carNombres[j] <- carNombres[j+1]
									carCantidades[j] <- carCantidades[j+1]
									carSubtotales[j] <- carSubtotales[j+1]
								FinPara
								totalItems <- totalItems - 1
								eliminado <- Verdadero
								Escribir "Producto eliminado."
								i <- totalItems + 1 // Para romper el ciclo
							FinSi
						FinPara
						Si No eliminado Entonces Escribir "ID no encontrado."; FinSi
					FinSi
					Escribir "Presione Enter para volver..."; Leer Tecla
					
				4: // PAGAR
					Limpiar Pantalla
					Si totalItems == 0 Entonces
						Escribir "No hay productos para pagar."
					Sino
						subtotalFinal <- 0
						Escribir "================================"
						Escribir "      VOUCHER ELECTRÓNICO       "
						Escribir "================================"
						Para i<-1 Hasta totalItems Hacer
							Escribir carNombres[i], " x", carCantidades[i], "  S/ ", carSubtotales[i]
							subtotalFinal <- subtotalFinal + carSubtotales[i]
						FinPara
						igv <- subtotalFinal * 0.18
						Escribir "--------------------------------"
						Escribir "SUBTOTAL:      S/ ", subtotalFinal
						Escribir "IGV (18%):     S/ ", igv
						Escribir "TOTAL A PAGAR: S/ ", (subtotalFinal + igv)
						Escribir "================================"
						Escribir "   ¡Gracias por su compra!"
						continuar <- Falso
					FinSi
					Leer Tecla
					
				5:
					continuar <- Falso
			FinSegun
		FinMientras
FinAlgoritmo
	
