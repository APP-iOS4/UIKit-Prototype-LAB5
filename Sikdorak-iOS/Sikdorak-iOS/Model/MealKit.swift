//
//  MealKit.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/16/24.
//

import Foundation

struct MealKit {
    var jjigae: Jjigae
    var topping: [Topping]
    var sari: [Topping]
    var likeCount: Int
    var price: Int = 0
    
    
    static let mockData: [MealKit] = [
        MealKit(
            jjigae: Jjigae(
                image: "kimchi",
                name: "김치찌개",
                spicy: [.a, .b, .c],
                price: 7000
            ),
            topping: [
                Topping(
                    image: "ramen_sari",
                    name: "돼지고기",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "소고기",
                    price: 3000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "참치",
                    price: 1500
                ),
                Topping(
                    image: "ramen_sari",
                    name: "꽁치",
                    price: 1500
                )
            ],
            sari: [
                Topping(
                    image: "ramen_sari",
                    name: "라면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "우동",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "당면",
                    price: 1000
                ),
            ],
            likeCount: 9999
        ),
        MealKit(
            jjigae: Jjigae(
                image: "brownSoup",
                name: "된장찌개",
                spicy: [],
                price: 6000
            ),
            topping: [
                Topping(
                    image: "ramen_sari",
                    name: "돼지고기",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "소고기",
                    price: 3000
                ),
            ],
            sari: [
                Topping(
                    image: "ramen_sari",
                    name: "라면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "우동",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "당면",
                    price: 1000
                ),
            ],
            likeCount: 4013
        ),
        MealKit(
            jjigae: Jjigae(
                image: "Buzzi",
                name: "부대찌개",
                spicy: [.a, .b, .c],
                price: 8000
            ),
            topping: [
                Topping(
                    image: "ramen_sari",
                    name: "돼지고기",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "소고기",
                    price: 3000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "참치",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "햄",
                    price: 2500
                ),
                Topping(
                    image: "ramen_sari",
                    name: "스팸",
                    price: 3000
                )
            ],
            sari: [
                Topping(
                    image: "ramen_sari",
                    name: "라면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "우동",
                    price: 1500
                ),
                Topping(
                    image: "ramen_sari",
                    name: "당면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "떡",
                    price: 1000
                )
            ],
            likeCount: 7821
        ),
        MealKit(
            jjigae: Jjigae(
                image: "kimchi",
                name: "김치찌개",
                spicy: [.a, .b, .c],
                price: 7000
            ),
            topping: [
                Topping(
                    image: "ramen_sari",
                    name: "돼지고기",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "소고기",
                    price: 3000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "참치",
                    price: 1500
                ),
                Topping(
                    image: "ramen_sari",
                    name: "꽁치",
                    price: 1500
                )
            ],
            sari: [
                Topping(
                    image: "ramen_sari",
                    name: "라면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "우동",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "당면",
                    price: 1000
                ),
            ],
            likeCount: 9999
        ),
        MealKit(
            jjigae: Jjigae(
                image: "brownSoup",
                name: "된장찌개",
                spicy: [],
                price: 6000
            ),
            topping: [
                Topping(
                    image: "ramen_sari",
                    name: "돼지고기",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "소고기",
                    price: 3000
                ),
            ],
            sari: [
                Topping(
                    image: "ramen_sari",
                    name: "라면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "우동",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "당면",
                    price: 1000
                ),
            ],
            likeCount: 4013
        ),
        MealKit(
            jjigae: Jjigae(
                image: "Buzzi",
                name: "부대찌개",
                spicy: [.a, .b, .c],
                price: 8000
            ),
            topping: [
                Topping(
                    image: "ramen_sari",
                    name: "돼지고기",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "소고기",
                    price: 3000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "참치",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "햄",
                    price: 2500
                ),
                Topping(
                    image: "ramen_sari",
                    name: "스팸",
                    price: 3000
                )
            ],
            sari: [
                Topping(
                    image: "ramen_sari",
                    name: "라면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "우동",
                    price: 1500
                ),
                Topping(
                    image: "ramen_sari",
                    name: "당면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "떡",
                    price: 1000
                )
            ],
            likeCount: 7821
        ),
        MealKit(
            jjigae: Jjigae(
                image: "kimchi",
                name: "김치찌개",
                spicy: [.a, .b, .c],
                price: 7000
            ),
            topping: [
                Topping(
                    image: "ramen_sari",
                    name: "돼지고기",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "소고기",
                    price: 3000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "참치",
                    price: 1500
                ),
                Topping(
                    image: "ramen_sari",
                    name: "꽁치",
                    price: 1500
                )
            ],
            sari: [
                Topping(
                    image: "ramen_sari",
                    name: "라면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "우동",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "당면",
                    price: 1000
                ),
            ],
            likeCount: 9999
        ),
        MealKit(
            jjigae: Jjigae(
                image: "brownSoup",
                name: "된장찌개",
                spicy: [],
                price: 6000
            ),
            topping: [
                Topping(
                    image: "ramen_sari",
                    name: "돼지고기",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "소고기",
                    price: 3000
                ),
            ],
            sari: [
                Topping(
                    image: "ramen_sari",
                    name: "라면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "우동",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "당면",
                    price: 1000
                ),
            ],
            likeCount: 4013
        ),
        MealKit(
            jjigae: Jjigae(
                image: "Buzzi",
                name: "부대찌개",
                spicy: [.a, .b, .c],
                price: 8000
            ),
            topping: [
                Topping(
                    image: "ramen_sari",
                    name: "돼지고기",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "소고기",
                    price: 3000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "참치",
                    price: 2000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "햄",
                    price: 2500
                ),
                Topping(
                    image: "ramen_sari",
                    name: "스팸",
                    price: 3000
                )
            ],
            sari: [
                Topping(
                    image: "ramen_sari",
                    name: "라면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "우동",
                    price: 1500
                ),
                Topping(
                    image: "ramen_sari",
                    name: "당면",
                    price: 1000
                ),
                Topping(
                    image: "ramen_sari",
                    name: "떡",
                    price: 1000
                )
            ],
            likeCount: 7821
        )
    ]
}
