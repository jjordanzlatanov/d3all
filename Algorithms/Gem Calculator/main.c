#include <stdio.h>

int main(){
    int amount_gems = 1; // How many gems you want?

    int gem_tier = 1; //  0 - Marquise; 1 - Imperial; 2 - Flawless Imperial; 3 - Royal; 4 - Flawless Royal

    int gem_type = 1; //  0 - Topaz; 1 - Ruby; 2 - Emerald; 3 - Amethyst; 4 - Diamond
    
    int gems[5][2] = { {10, 10}, {20, 20}, {30, 30}, {40, 40}, {50, 50} }; // Input your amount of marquise and imperial gems

    int gem_sum[5][5] = { {gems[0][0], gems[0][1], 0, 0, 0},  {gems[1][0], gems[1][1], 0, 0, 0}, {gems[2][0], gems[2][1], 0, 0, 0}, {gems[3][0], gems[3][1], 0, 0, 0}, {gems[4][0], gems[4][1], 0, 0, 0} };

    int essence_amount[5];

    for(int i = 0; i < 5; i++){
        for(int j = 0; j < 5; j++){
            if(gem_type != j){
                gem_sum[gem_type][gem_tier] += (gem_sum[gem_type][j] / 9) * 9;
            }
        }
    }
    
    


    return 0;
}