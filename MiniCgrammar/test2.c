#include<stdio.h>
#include<stdlib.h>

/* Hello and welcome to the final testing stage of the C grammar I wrote
where were gonna see whether or not we can get this to work for a longer
and more complex project */

int main()
{
   //testing single line comments
   char play_response;
   printf("Welcome to my little nonsenical game are you ready to play? (y/n)");
   scanf("%c",&play_response);

   char ready_response; 
   printf("Kay now think of a number , once you have it enter 'y' "); //testing the print
   scanf("%c",&ready_response);

   //testing if-else statements
   if (ready_response='y')
   {
    int a= rand();
    printf("Sweet was this your number: %d (y/n)",a);
    char ans_response;
    scanf("%c",&ans_response);
    if (ans_response ='n')
        printf("BOOOOOO!");
    else
        printf("Whoaa! what are the chances!");

   }
   else
   {
    printf("Someone's still not ready whoops, lets move on to dumb math!");
   }
   int a,b;
   float c,d;
   
   a=10;
   b=3;

   c=4.12;
   d=16.8;

   int int_multiple= a * b ;
   int fl_multiple= c * d;
   int fl_and_int_multiple= b * d;

   if (fl_multiple > int_multiple)
   {
      printf("hmmm ints returned something smaller");
   }
   else
   {
      printf("hmmm floatss returned something smaller");
   }

   printf("kay now lets play GUESS THAT STARSIGN!");
   char star_sign;
   printf("when were you born?\n");
   printf("a) November\n");
   printf("b) August\n");
   printf("c) October");
   scanf("%c",&star_sign);
   //testing switch statements
   switch (star_sign)        
   {
      case 'a':
         printf("You're a scorpio\n");
         break;
      case 'b':
         printf("You're a vergo\n");
         break;
      case 'c':
         printf("You're a libra\n");
         break;
      default:
         printf("You entered an invalid choice\n");
   }

   printf("still looking at starigns lets see the overlap!");
   printf("Now just input the number of 2 months in the years lets find that overlap");
   int a,b;
   scanf("%d",&a);
   scanf("%d",&b);
   //testing logical operators
   if (a <6  && b > 8)
      printf("Nope no overlap");
   if (a == b)
      printf("Woahhhh there's an overalp");
   if (!(a > 3) || !(b < 9))
      printf("Nope, again no overlap");

   printf("Nice now lets look into some complex looping through a small game");
   int age;
   int year;
   printf("Tell me your age: ");
   scanf("%d",&age);
   printf("Now tell me what year it is: ");
   scanf("%d",&year);
   //for loop testing
   for (int i = 1;i <= age;i++)     
      printf("you were %d years old in %d", i, year - age + i);

   
   int i=0;

   //while loop testing
   while (i <= age)
   {
      i++;
      continue;
      printf("at one point you were %d years old",i);
   }

   while (i <= 10+age)
   {
      i++;
      if (i == 5+age)
         break;
   }

}
