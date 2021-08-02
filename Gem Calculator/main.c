#include <stdio.h>

int main(){
    int amount_gems = 1; // How many gems you want?

    int gem_tier = 4; //  0 - Marquise; 1 - Imperial; 2 - Flawless Imperial; 3 - Royal; 4 - Flawless Royal

    int gem_type = 2; //  0 - Topaz; 1 - Ruby; 2 - Emerald; 3 - Amethyst; 4 - Diamond
    
    int gems[5][2] = { {10, 10}, {20, 20}, {30, 30}, {40, 40}, {50, 50} }; // Input your amount of marquise and imperial gems

    int gem_sum[5];

    for(int i = 0; i < 5; i++){ // i -  Gem tier
        if(i < 2){
            for(int j = 0; j < 5; j++){ // j - Gem type
                if(j != gem_type){
                    gem_sum[i] += (gems[j][i] / 9) * 9;
                }else{
                    gem_sum[i] += gems[j][i];
                }
            }
        }

        if(i > 0){
            gem_sum[i] += (gem_sum[i - 1] / 3) * 3;
        }

        if(i == gem_tier){
            printf("%d", gem_sum[i]);
        }
    }

    return 0;
}