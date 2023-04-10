import './price.css'
import { formatPrice } from '../../utils/utils';

const Price = ({price}) => {
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