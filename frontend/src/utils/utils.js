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

export function reviewProcesser(reviews) {
    const total = Object.keys(reviews).length
    const counts = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0}

    for (let key in reviews) {
        let rating = reviews[key].rating
        counts[rating]+= 1
    }

    let output = []

    for (let i = 1; i <= 5; i++) {
        output.push(Math.floor((counts[i] / total) * 100))
    }
    return {counts: Object.values(counts), percentages: output}
}