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