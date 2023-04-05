
const DisplayCard = ({item}) => {

    return (
        <>
            <p>----------------------------------------</p>
            <ul>
                <li key="name">{item.name}</li>
                <li key="animalType">{item.animalType}</li>
                <li key="price">{item.price}</li>
                <li key="description">{item.description}</li>
            </ul>
            <p>----------------------------------------</p>
            <p>----------------------------------------</p>
        </>
    )

}

export default DisplayCard;
