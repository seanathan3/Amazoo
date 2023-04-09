import Price from "../Price";
import './addItemForm.css'


const AddItemForm = ({price}) => {


    return (
        <>
            <div id="showCheckout">

                <Price price={price} />
                <div id="freeReturns">FREE Returns</div>
                <div id="inStock">In Stock</div>

                <form id="addToCartForm">
                    <div id="cartFormSelectContainer">

                        <label htmlFor="quantity" className="quantityLabel">Qty: &nbsp;</label>
                        <select name="qty" id="qty" className="cartFormSelect">
                            <option value={1}>1</option>
                            <option value={2}>2</option>
                            <option value={3}>3</option>
                            <option value={4}>4</option>
                            <option value={5}>5</option>
                            <option value={6}>6</option>
                            <option value={7}>7</option>
                            <option value={8}>8</option>
                            <option value={9}>9</option>
                            <option value={10}>10</option>
                            <option value={11}>11</option>
                            <option value={12}>12</option>
                            <option value={13}>13</option>
                            <option value={14}>14</option>
                            <option value={15}>15</option>
                            <option value={16}>16</option>
                            <option value={17}>17</option>
                            <option value={18}>18</option>
                            <option value={19}>19</option>
                            <option value={20}>20</option>
                        </select>
                    </div>

                    <br />
                    <button id="addToCartButton">Add to Cart</button>
                </form>
            </div>
    </>
    )
}

export default AddItemForm;