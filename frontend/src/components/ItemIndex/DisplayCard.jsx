
import './items.css'

const DisplayCard = ({item}) => {


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

        finalStringArr.unshift('$')

        return finalStringArr.slice(0, finalStringArr.length - 1).join('')
    }

    const formattedPrice = formatPrice(item.price)




    return (
        <>
            <div className="card">
                <div className="cardItemImageBox">
                    <img id="cardPhoto" src={item.photoUrl} alt="photo" />
                </div>
                <div className="cardItemText">
                    <div className="cardLine">
                        <div id="cardName" key="name">{item.name}</div>
                        <div id="cardAnimalType" key="animalType">{item.animalType}</div>
                    </div>
                    <p id="cardReviews" className="cardLine">Reviews Placeholder</p>
                    <div id="cardPrice" className="cardLine" key="price">{formattedPrice}</div>
                </div>
            </div>
        </>
    )

}

export default DisplayCard;
