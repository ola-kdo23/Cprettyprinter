#include < stdio.h >

int main ()
{
    int i, times;
    printf ("How many times do you want the program's loop to run?");
    scanf ("%d", & times);
    i = 0;
    int j;
    j = 0;
    while (i <= times)
    {
        while (j <= times)
        {
            printf ("%d\n", j);
            j ++;
        }
        if (i > 2)
        {
            printf ("%d\n", i);
        }
        i ++;
    }
    for (int k = 0; k < times; k ++)
    {
        if (k == 1)
        {
            printf ("I'm the for loop and this is my %dst time printing", k);
        }
        else
        {
            printf ("I'm the for loop and this is my %dth time printing", k);
        }
    }
    return 0;
}
