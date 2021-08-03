#include <stdio.h>

int main(){
    int amount_gems = 3; // How many gems you want?

    int gems_tier = 3; //  0 - Marquise; 1 - Imperial; 2 - Flawless Imperial; 3 - Royal; 4 - Flawless Royal

    int gems_needed[5];

    int gems_type = 0; //  0 - Topaz; 1 - Ruby; 2 - Emerald; 3 - Amethyst; 4 - Diamond

    int gems[5][2] = { {10, 10}, {20, 20}, {30, 30}, {40, 40}, {50, 50} }; // Input your amount of marquise and imperial gems

    int essence[2] = {0, 0};

    int total_gems[2] = {0, 0};

    int leftover = 0;

    gems_needed[gems_tier] = amount_gems;

    for(int i = gems_tier - 1; i >= 0; i--){
        gems_needed[i] = gems_needed[i + 1] * 3;
    }

    for(int i = 0; i < 2; i++){
        for(int j = 0; j < 5; j++){
            if(j != gems_type){
                essence[i] += gems[j][i] / 9;
            }
        }

        total_gems[i] += gems[gems_type][i] + (essence[i] * 9);
    }

    if(total_gems[1] >= gems_needed[1]){
        leftover = total_gems[1] - gems_needed[1];
        essence[1] -= leftover / 9;

        printf("%d Essence for Imperial\n", essence[1]);
    }else{
        total_gems[1] += total_gems[0] / 3;

        if(total_gems[1] >= gems_needed[1]){
            leftover = total_gems[1] - gems_needed[1];
            essence[0] -= (leftover * 3) / 9;

            printf("%d Essence for Marquise\n", essence[0]);
            printf("%d Essence for Imperial\n", essence[1]);
        }else{
            printf("You need %d more Imperials or %d more Marquise", gems_needed[1] - (total_gems[1] - (total_gems[0] / 3)), (gems_needed[1] - total_gems[1]) * 3);
        }
    }



    return 0;
}