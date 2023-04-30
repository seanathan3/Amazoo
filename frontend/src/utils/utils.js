export function formatPrice(price) {
    if (!price) {
        return null
    }

    let stringifiedPriceArr = price.toString().split('');
    let counter = 0;
    let finalStringArr = [];
    
    while (stringifiedPriceArr.length > 0) {
        if (counter % 3 === 0) {
            finalStringArr.unshift(',')
        }
        finalStringArr.unshift(stringifiedPriceArr.pop())
        counter++
    }


    return finalStringArr.slice(0, finalStringArr.length - 1).join('')
}

export function calcTotalItems(cartItemsArr) {
    let output = 0;
    for (let i = 0; i < cartItemsArr.length; i++) {
        output += cartItemsArr[i].quantity
    }
    return output
}

export function calcSubtotal(cartItemsArr, itemsArr) {
    if (!cartItemsArr || !itemsArr) return null
    let total = 0;
    cartItemsArr.forEach(cartItem => {
        let associated_item = null;
        if (itemsArr.length === 0) return 0
        itemsArr.forEach(item => {
            if (cartItem.itemId === item.id) {
                associated_item = item
            }
        })
        total += cartItem.quantity * associated_item?.price
    });
    return total;
}

export function calcAverageRating(obj) {
    let sum = 0
    for (let key in obj) {
        sum += obj[key].rating
    }
    return sum
}