import './price.css'

const Price = ({price}) => {

    function formatPrice(price) {
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

    const formattedPrice = price ? formatPrice(price) : 0

    return (
        <div className="cardPriceBox">
            <span className="cardDollarSign">$</span>
            <span className="cardPrice" key="price">{formattedPrice}</span>
            <span className="cardSmallZeroes">00</span>
        </div>
    )
}

export default Price;