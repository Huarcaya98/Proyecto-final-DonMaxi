using System;

class Program
{
    static void Main(string[] args)
    {
        //ARREGLO DE PRODUCTOS--cat=categoria
        int[] catIds={1,2,3,4,5,6,7,8,9,10};
        string[] catNombres={"Aceite","Arroz","Azucar","Fideos","Leche","Atun","Cafe","Huevos","Lentejas","Papel"};
        double[] catPrecios={120.50,130.00,95.50,62.00,72.00,250.00,98.00,125.00,180.00,100.00};

        //ARREGLO DEL CARRITO--car=carrito
        int[] carIds=new int[50];
        string[] carNombres=new string[50];
        double[] carSubtotal=new double[50];
        int[] carCantidades= new int[50];

    
        Console.WriteLine("Base Main - Proyecto");

    }
}