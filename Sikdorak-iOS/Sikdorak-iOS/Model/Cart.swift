//
//  Cart.swift
//  Sikdorak-iOS
//
//  Created by 유지호 on 1/16/24.
//

import Foundation

struct Cart {
    var name: String
    var spicy: Spicy
    var topping: [Topping]
    var sari: [Topping]
    var price: Int
    
    static let mockData: [Cart] = [
        Cart(
            name: "김치찌개",
            spicy: .b,
            topping: [
                Topping(
                    image: "",
                    name: "스팸",
                    price: 3000
                ),
                Topping(
                    image: "",
                    name: "소세지",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "두부",
                    price: 2000
                )
            ],
            sari: [
                Topping(
                    image: "",
                    name: "떡",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "라면",
                    price: 1000
                )
            ],
            price: 6900
        ),
        Cart(
            name: "김치찌개",
            spicy: .b,
            topping: [
                Topping(
                    image: "",
                    name: "스팸",
                    price: 3000
                ),
                Topping(
                    image: "",
                    name: "소세지",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "두부",
                    price: 2000
                )
            ],
            sari: [
                Topping(
                    image: "",
                    name: "떡",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "라면",
                    price: 1000
                )
            ],
            price: 6900
        ),
        Cart(
            name: "김치찌개",
            spicy: .b,
            topping: [
                Topping(
                    image: "",
                    name: "스팸",
                    price: 3000
                ),
                Topping(
                    image: "",
                    name: "소세지",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "두부",
                    price: 2000
                )
            ],
            sari: [
                Topping(
                    image: "",
                    name: "떡",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "라면",
                    price: 1000
                )
            ],
            price: 6900
        ),
        Cart(
            name: "김치찌개",
            spicy: .b,
            topping: [
                Topping(
                    image: "",
                    name: "스팸",
                    price: 3000
                ),
                Topping(
                    image: "",
                    name: "소세지",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "두부",
                    price: 2000
                )
            ],
            sari: [
                Topping(
                    image: "",
                    name: "떡",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "라면",
                    price: 1000
                )
            ],
            price: 6900
        ),
        Cart(
            name: "김치찌개",
            spicy: .b,
            topping: [
                Topping(
                    image: "",
                    name: "스팸",
                    price: 3000
                ),
                Topping(
                    image: "",
                    name: "소세지",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "두부",
                    price: 2000
                )
            ],
            sari: [
                Topping(
                    image: "",
                    name: "떡",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "라면",
                    price: 1000
                )
            ],
            price: 6900
        ),
        Cart(
            name: "김치찌개",
            spicy: .b,
            topping: [
                Topping(
                    image: "",
                    name: "스팸",
                    price: 3000
                ),
                Topping(
                    image: "",
                    name: "소세지",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "두부",
                    price: 2000
                )
            ],
            sari: [
                Topping(
                    image: "",
                    name: "떡",
                    price: 1500
                ),
                Topping(
                    image: "",
                    name: "라면",
                    price: 1000
                )
            ],
            price: 6900
        )
    ]
}
