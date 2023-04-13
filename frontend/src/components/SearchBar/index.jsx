import { useState } from 'react';
import './searchBar.css';

const SearchBar = () => {
    const [query, setQuery] = useState('')

    function handleSubmit(e) {
        e.preventDefault();
    }

    return (
            <form onSubmit={handleSubmit} id="searchBarContainer">
                <input type="text" id="searchBarText" value={query} onChange={e => setQuery(e.target.value)} placeholder='Search Amazoo' />
                <button id="searchButton">
                    <div style={{fontSize: '18px'}}>
                        <i className="fa-solid fa-magnifying-glass"></i>
                    </div>
                </button>
            </form>
    )
}

export default SearchBar;
