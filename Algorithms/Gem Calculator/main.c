#include <stdio.h>

int main(){
    int white[2] = {15, 10};
    int purple[2] = {10, 10};
    int green[2] = {10, 10};
    int red[2] = {10, 10};
    int yellow[2] = {10, 10};
    
    int firstconvertions = white[0] / 9 + white[1] / 9;

    white[0] = white[0] - (white[0] / 9) * 9;
    white[1] = white[1] - (white[1] / 9) * 9;
    
    printf("%d", white[0]); 


    return 0;
}