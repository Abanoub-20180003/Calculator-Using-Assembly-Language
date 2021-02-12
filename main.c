#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>

/*
 *
 */
  int size = 0;
  char choice = 0;


//##############################################################################
//Raafat
int getArrayOfIntegers(int *arr)
{

    for(int i = 0; i < size; i++)
    {
        int x;
        scanf("%d", &x);
        arr[i] = x;
    }
    return *arr;

}

int getArrayOfCharacters(char *arr)
{

    for(int i = 0; i < size; i++)
    {
        char x;
        fflush(stdin);
        scanf("%c", &x);
        arr[i] = x;
    }
    return *arr;
}


void printIntElemnts(int arr[],int flagP){
    if(flagP==0)
    {
    for(int i = 0; i < size ; i++){
        printf("%d ",arr[i]);
        }
    }
    if (flagP==1)
    {
        for(int i = 0; i < size ; i++){
        printf("%d. %d\n",i+1,arr[i]);
        }
    }
}

void printCharElemnts(char arr[],int flagC){
    if(flagC==0)
    {
    for(int i = 0; i < size ; i++){
         printf("%c ",arr[i]);
        }
    }
    if (flagC==1)
    {
        for(int i = 0; i < size ; i++){
        printf("%d. %c\n",i+1,arr[i]);
        }
    }
}




//##############################################################################
//binarySearch  Ahmad

void binarySearchInt(int arr [], int search){
   int first, last, middle;



  first = 0;
  last = size - 1;
  middle = (first+last)/2;

  while (first <= last) {
    if (arr[middle] < search)
      first = middle + 1;
    else if (arr[middle] == search) {
        printf("Number[%d] is found at row[%d]\n", search , middle+1);
        printf("*******\n\n");
      break;
    }
    else
      last = middle - 1;

    middle = (first + last)/2;
  }
  if (first > last)
  {
      printf("NOT FOUND!\nNumber[%d] was not found at the list\n", search);
      printf("*******\n\n");
  }

}

void binarySearchChar( char arr[], char search){
    int first, last, middle;



  first = 0;
  last = size - 1;
  middle = (first+last)/2;

  while (first <= last) {
    if (arr[middle] < search)
      first = middle + 1;
    else if (arr[middle] == search) {
       printf("Character[%c] is found at row[%d]\n", search , middle+1);
        printf("*******\n\n");
      break;
    }
    else
      last = middle - 1;

    middle = (first + last)/2;
  }
    if (first > last)
    {
      printf("NOT FOUND!\nCharacter[%c] was not found at the list\n", search);
      printf("*******\n\n");
    }
}

//##############################################################################
//insertionSort
void swapIntegers(int *m, int *n)
{
    /// Swapping two elements
    int temp = *m;
    *m = *n;
    *n = temp;
}

void swapCharacters(char *m, char *n)
{
    char temp = *m;
    *m = *n;
    *n = temp;
}

void insertionSort(int * arr, int size)
{
    while(true)
    {
        bool foundSwappable = false;
        for(int i = 1; i < size; i++)
        {
            if(arr[i] < arr[i-1])
            {
                foundSwappable = true;
                swapIntegers(&arr[i], &arr[i-1]);
            }
        }
        if(!foundSwappable)
            break;
    }
}

void insertionSortChars(char * arr, int size)
{
    while(true)
    {
        bool foundSwappable = false;
        for(int i = 1; i < size; i++)
        {
            if(arr[i] < arr[i-1])
            {
                foundSwappable = true;
                swapCharacters(&arr[i], &arr[i-1]);
            }
        }
        if(!foundSwappable)
            break;
    }
}

//##############################################################################
//mergeSort
void Merge(int *arr, int l, int m, int r)
{
    int n1 = m - l + 1;
    int n2 = r - m;

    int L[n1], R[n2];

    for (int i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (int j = 0; j < n2; j++)
        R[j] = arr[m + 1 + j];


    int i = 0, j = 0, k = l;
    while (i < n1 && j < n2)
    {
        if (L[i] <= R[j])
        {
            arr[k] = L[i];
            i++;
        }
        else
        {
            arr[k] = R[j];
            j++;
        }
        k++;
    }
    while (i < n1)
    {
        arr[k] = L[i];
        i++;
        k++;
    }
    while (j < n2)
    {
        arr[k] = R[j];
        j++;
        k++;
    }
}

void MergeSort(int *arr, int l, int r)
{
    if (l < r)
    {
        int m = l + (r - l) / 2;

        MergeSort(arr, l, m);
        MergeSort(arr, m + 1, r);

        Merge(arr, l, m, r);
    }
}

void MergeChars(char *arr, int l, int m, int r)
{
    int n1 = m - l + 1;
    int n2 = r - m;

    int L[n1], R[n2];

    for (int i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (int j = 0; j < n2; j++)
        R[j] = arr[m + 1 + j];


    int i = 0, j = 0, k = l;
    while (i < n1 && j < n2)
    {
        if (L[i] <= R[j])
        {
            arr[k] = L[i];
            i++;
        }
        else
        {
            arr[k] = R[j];
            j++;
        }
        k++;
    }
    while (i < n1)
    {
        arr[k] = L[i];
        i++;
        k++;
    }
    while (j < n2)
    {
        arr[k] = R[j];
        j++;
        k++;
    }
}

void MergeSortChars(char *arr, int l, int r)
{
    if (l < r)
    {
        int m = l + (r - l) / 2;

        MergeSortChars(arr, l, m);
        MergeSortChars(arr, m + 1, r);

        MergeChars(arr, l, m, r);
    }
}
//##############################################################################
//quickSort
int partition(int *arr, int low, int high)
{
    int pivot = arr[high];
    int i = (low - 1);
    for (int j = low; j <= high- 1; j++)
    {

        if (arr[j] < pivot)
        {
            i++;
            swapIntegers(&arr[i], &arr[j]);
        }
    }
    swapIntegers(&arr[i + 1], &arr[high]);
    return (i + 1);
}

void quickSort(int *arr, int low, int high)
{
    if (low < high)
    {

        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

int partitionChars(char *arr, int low, int high)
{
    int pivot = arr[high];
    int i = (low - 1);
    for (int j = low; j <= high- 1; j++)
    {

        if (arr[j] < pivot)
        {
            i++;
            swapCharacters(&arr[i], &arr[j]);
        }
    }
    swapCharacters(&arr[i + 1], &arr[high]);
    return (i + 1);
}

void quickSortChars(char *arr, int low, int high)
{
    if (low < high)
    {

        int pi = partitionChars(arr, low, high);
        quickSortChars(arr, low, pi - 1);
        quickSortChars(arr, pi + 1, high);
    }
}
int choiceTypeOfIntSort(int * ArrayOfIntElemnts,char choice){
     if(choice == 'a')
            {
                 insertionSort(ArrayOfIntElemnts, size);
                 return 1 ;
            }
            else if(choice == 'b')
            {
                 MergeSort(ArrayOfIntElemnts, 0, size-1);
                 return 1 ;
            }
            else if(choice == 'c')
            {
                 quickSort(ArrayOfIntElemnts, 0, size-1);
                 return 1 ;
            }
            else{
                return -1;
            }

}

int  choiceTypeOfCharSort(char * ArrayOfCharElemnts,char choice){
     if(choice == 'a')
            {
                 insertionSortChars(ArrayOfCharElemnts, size);
                 return 1 ;
            }
            else if(choice == 'b')
            {
                 MergeSortChars(ArrayOfCharElemnts, 0, size-1);
                 return 1 ;
            }
            else if(choice == 'c')
            {
                 quickSortChars(ArrayOfCharElemnts, 0, size-1);
                 return 1 ;
            }
            else
                return -1;

}
//########################################""MAIN""###########################################
int main(int argc, char** argv) {
    printf("THIS PROGRAM IS DESIGNED FOR SORTING ( NUMBERS & CHARACTERS )\nWITH DIFFERENT SORTING ALGORITHM UPON YOUR CHOICE\n-------------------------------------------------------------\n\n");
    while(1){
        printf("Choose the type of the elements that you wish to sort \n a --> NUMBERS \n b --> CHARACTERS \n(a/b)? :");


        scanf("%s", &choice);
        printf("*******\n\n");
        if(choice == 'a')
        {
            printf("YOUR CHOICE:NUMBERS\n*********\n\n");
            int unsArrayOfIntElemnts[size];
            printf("Enter how many number you wish to sort :");

            scanf("%d", &size);
            printf("*******\n\n");
            printf("%s", "Enter the list of numbers one by one\n(HINT:EACH ROW SHOULD CONTAIN ONLY ONE ELEMENT)\n");
            //get array from user and put in unsArrayOfIntElemnts
            getArrayOfIntegers(unsArrayOfIntElemnts);

            //copy unsArray to new Array
            int ArrayOfIntElemnts[size] ;
            for(int i = 0; i < size ; i++){
               ArrayOfIntElemnts[i] = unsArrayOfIntElemnts[i];
            }
             printf("*******\n\n");
            //choice type of sort
            while(1){
                printf("Choose the sort method from the list below\n"
                       " a --> INSERTION SORT\n"
                       " b --> MERGE SORT\n"
                       " c --> QUICK SORT\n");
                printf("(a/b/c)? :");
                scanf("%s", &choice);
              printf("*******\n\n");


                int result = choiceTypeOfIntSort(ArrayOfIntElemnts ,choice);



                if(result == -1)
                    printf("INCORRECT CHOICE\nYOUR CHOICE SHOULD BE (a/b/c)\n*********\n\n");
                else
                    break;
            }

            /// make sure every thing works
            printf("ELEMENTS BEFORE SORTING\n");
            printf("[ ");
            printIntElemnts(unsArrayOfIntElemnts,0);
            printf("]\n");
            printf("*******\n\n");



            printf("ELEMENTS AFTER SORTING\n");
            printf("-----\n");
            printIntElemnts(ArrayOfIntElemnts,1);
            printf("-----\n");
            printf("*******\n\n");

            while(1){
                printf("Choose an option\n"
                        " a --> SEARCH FOR NUMBER\n"
                        " b --> START OVER\n"
                        " c --> EXIT\n"
                        "(a/b/c)? :");
                scanf("%s", &choice);
                printf("*******\n\n");
                if(choice == 'a'){
                    printf("Enter the number that you are searching for :");
                    int search;
                    scanf("%d", &search);
                    printf("*******\n\n");
                    binarySearchInt( ArrayOfIntElemnts ,search);
                }
                else if(choice == 'b')
                    {
                     break;
                    }
                else if(choice == 'c')
                {
                    printf("<<<<<< THANKS! >>>>>>\n");
                    return 0;
                }
                else {printf("INCORRECT CHOICE\nYOUR CHOICE SHOULD BE (a/b/c)\n*********\n\n");}
            }
        }
        ///////////////////////////////////////////////////////////////
        //////////////////////CHARACTER////////////////////////////////
        else if(choice == 'b')
        {
             printf("YOUR CHOICE:CHARACTERS\n*********\n\n");
            char unArrayOfCharElements[size];
            fflush(stdin);
             printf("Enter how many character you wish to sort :");
            scanf("%d", &size);
             printf("*******\n\n");
            printf("%s", "Enter the list of characters one by one\n(HINT:EACH ROW SHOULD CONTAIN ONLY ONE ELEMENT)\n");
            getArrayOfCharacters(unArrayOfCharElements);

            //copy unsArray to new Array
            char ArrayOfCharElemnts[size] ;
            for(int i = 0; i < size ; i++){
               ArrayOfCharElemnts[i] = unArrayOfCharElements[i];
            }
            printf("*******\n\n");

            while(1){
                     printf("Choose the sort method from the list below\n"
                       " a --> INSERTION SORT\n"
                       " b --> MERGE SORT\n"
                       " c --> QUICK SORT\n");
                printf("(a/b/c)? :");
                scanf("%s", &choice);
              printf("*******\n\n");

                int result = choiceTypeOfCharSort(ArrayOfCharElemnts,choice);



                if(result == -1)
                    printf("INCORRECT CHOICE\nYOUR CHOICE SHOULD BE (a/b/c)\n*********\n\n");
                else
                    break;
            }

            /// make sure every thing works
            printf("ELEMENTS BEFORE SORTING\n");
            printf("[ ");
            //printIntElemnts(unsArrayOfIntElemnts,0);
            printCharElemnts(unArrayOfCharElements,0);
            printf("]\n");
            printf("*******\n\n");



            printf("ELEMENTS AFTER SORTING\n");
            printf("-----\n");
           // printIntElemnts(ArrayOfIntElemnts,1);
            printCharElemnts(ArrayOfCharElemnts,1);
            printf("-----\n");
            printf("*******\n\n");


            while(1){
                        printf("Choose an option\n"
                        " a --> SEARCH FOR CHARACTER\n"
                        " b --> START OVER\n"
                        " c --> EXIT\n"
                        "(a/b/c)? :");
                scanf("%s", &choice);
                printf("*******\n\n");
                if(choice == 'a'){
                    printf("Enter the character that you are searching for :");
                    char search;
                    scanf("%s", &search);
                    printf("*******\n\n");
                    binarySearchChar( ArrayOfCharElemnts ,search);
                }
                else if(choice == 'b')
                    {
                     break;
                    }
                else if(choice == 'c')
                {
                    printf("<<<<<< THANKS! >>>>>>\n");
                    return 0;
                }
                else {printf("INCORRECT CHOICE\nYOUR CHOICE SHOULD BE (a/b/c)\n*********\n\n");}
            }
        }
        else {
            printf("INCORRECT CHOICE\nYOUR CHOICE SHOULD BE (a/b)\n*********\n\n");
        }
    }//end while

    return (EXIT_SUCCESS);
}//end main
