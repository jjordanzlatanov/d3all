#include <stdio.h>

int main(){
    int amount_gems = 3; // How many gems you want?

    int gem_tier = 3; //  0 - Marquise; 1 - Imperial; 2 - Flawless Imperial; 3 - Royal; 4 - Flawless Royal

    int gems_needed[5];

    int gem_type = 2; //  0 - Topaz; 1 - Ruby; 2 - Emerald; 3 - Amethyst; 4 - Diamond

    int gems[5][2] = { {10, 10}, {20, 20}, {30, 30}, {40, 40}, {50, 50} }; // Input your amount of marquise and imperial gems

    int gem_sum[5];

    gems_needed[gem_tier] = amount_gems;

    for(int i = gem_tier - 1; i >= 0; i--){
        gems_needed[i] = gems_needed[i + 1] * 3;
    }

    

    return 0;
}