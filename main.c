


#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>

/*
 *
 */
  int size = 0;
  int choice = 0;





//##############################################################################
//Raafat
int getArrayOfIntegers(int * arr)
{
    
    for(int i = 0; i < size; i++)
    {
        int x;
        scanf("%d", &x);
        arr[i] = x;
    }
    return arr;

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
    return arr;
}

int choiceTypeOfIntSort(int * ArrayOfIntElemnts,int choice){
     if(choice == 1)
            {
                 insertionSort(ArrayOfIntElemnts, size);
                 return 1 ;
            }
            else if(choice == 2)
            {
                 MergeSort(ArrayOfIntElemnts, 0, size-1);
                 return 1 ;
            }
            else if(choice == 3)
            {
                 quickSort(ArrayOfIntElemnts, 0, size-1);
                 return 1 ;
            }
            else{
                return -1;
            }

}

int  choiceTypeOfCharSort(char * ArrayOfCharElemnts,char choice){
     if(choice == 1)
            {
                 insertionSortChars(ArrayOfCharElemnts, size);
                 return 1 ;
            }
            else if(choice == 2)
            {
                 MergeSortChars(ArrayOfCharElemnts, 0, size-1);
                 return 1 ;
            }
            else if(choice == 3)
            {
                 quickSortChars(ArrayOfCharElemnts, 0, size-1);
                 return 1 ;
            }
            else 
                return -1;

}

void printIntElemnts(int arr[]){
    for(int i = 0; i < size ; i++){
        printf("%d\n",arr[i]);
    }
}

void printCharElemnts(char arr[]){
    for(int i = 0; i < size ; i++){
        printf("%c\n",arr[i]);
    }
}




//##############################################################################
//binarySearch  Ahmad

int binarySearchInt(int arr [], int search){
   int first, last, middle;



  first = 0;
  last = size - 1;
  middle = (first+last)/2;

  while (first <= last) {
    if (arr[middle] < search)
      first = middle + 1;
    else if (arr[middle] == search) {
        printf("loction of %d is %d", search , middle);
      break;
    }
    else
      last = middle - 1;

    middle = (first + last)/2;
  }
  if (first > last)
      printf("Not found! %d isn't present in the list.\n", search);

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
       printf("loction of %c is %d", search , middle);
      break;
    }
    else
      last = middle - 1;

    middle = (first + last)/2;
  }
  if (first > last)//Not found! number  isn't present in the list.\n"
      printf("Not found! %c isn't present in the list.\n", search);

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
//######################################################################################
int main(int argc, char** argv) {
    while(1){
        printf("what kind of element you want to sort ?\n(1 - for numbers 2 - for characters)\n");


        scanf("%d", &choice);
        if(choice == 1)
        {
            int unsArrayOfIntElemnts[size];
            printf("how many elements?\n");
            scanf("%d", &size);
            printf("%s", "Enter your list of numbers\n");

            //get array from user and put in unsArrayOfIntElemnts
            getArrayOfIntegers(unsArrayOfIntElemnts);

            //copy unsArray to new Array 
            int ArrayOfIntElemnts[size] ;
            for(int i = 0; i < size ; i++){
               ArrayOfIntElemnts[i] = unsArrayOfIntElemnts[i];
            }
            
            //choice type of sort 
            while(1){
                printf("What kind of sort you want ?\n"
                       "1- for insertion sort\n"
                       "2- for merge sort\n"
                       "3- for quick sort\n");

                scanf("%d", &choice);
                
                
                
                int result = choiceTypeOfIntSort(ArrayOfIntElemnts ,choice);
               


                if(result == -1)
                    printf(" incorrect choice\n");
                else
                    break;    
            }

            /// make sure every thing works
            printf(" elements befor sorting\n");
            printIntElemnts(unsArrayOfIntElemnts);
            printf(" elements after sorting\n");
            printIntElemnts(ArrayOfIntElemnts);
            

            while(1){
                printf("choice an option 1-searche for number \n "
                        "2-sort elements\n"
                        "3-exit");
                scanf("%d", &choice);
                if(choice == 1){
                    printf("enter the number to search for ");
                    int search;
                    scanf("%d", &choice);
                    binarySearchInt( ArrayOfIntElemnts ,search);
                }
                else if(choice == 2)
                    break;
                else if(choice == 3)
                    return 0;
                else
                   printf("incorrect choice");
            }
        }
        else if(choice == 2)
        {
            char unArrayOfCharElements[size];
            fflush(stdin);
            printf("how many elements?\n");
            scanf("%d", &size);
            printf("%s", "Enter your list of numbers\n");

            getArrayOfCharacters(unArrayOfCharElements);

            //copy unsArray to new Array 
            char ArrayOfCharElemnts[size] ;
            for(int i = 0; i < size ; i++){
               ArrayOfCharElemnts[i] = unArrayOfCharElements[i];
            }


            while(1){
                printf("What kind of sort you want ?\n"
                       "1- for insertion sort\n"
                       "2- for merge sort\n"
                       "3- for quick sort\n");
                fflush(stdin);
                scanf("%d", &choice);

                int result = choiceTypeOfCharSort(ArrayOfCharElemnts,choice);
               


                if(result == -1)
                    printf(" incorrect choice\n");
                else
                    break;    
            }
            /// make sure every thing works
            printf(" elements befor sorting\n");
            printCharElemnts(unArrayOfCharElements);
            printf(" elements after sorting\n");
            printCharElemnts(ArrayOfCharElemnts);


            
            while(1){
                printf("choice an option 1-searche for character \n "
                        "2-sort elements\n"
                        "3-exit");
                scanf("%d", &choice);
                if(choice == 1){
                    printf("enter the character to search for ");
                    char search;
                    scanf("%d", &choice);
                    binarySearchChar( ArrayOfCharElemnts ,search);
                }
                else if(choice == 2)
                    break;
                else if(choice == 3)
                    return 0;
                else
                   printf("incorrect choice");

            }
        }
    }//end while

    return (EXIT_SUCCESS);
}//end main 



