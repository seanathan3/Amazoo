import "./pageNotFound.css";
import { Link } from "react-router-dom";

const PageNotFound = ({search}) => {
    
    if (search) {
        return (
            <>
            <div id="pnf-master-s">
                <div id="pnf-1">SORRY</div>
                <div id="pnf-2">we couldn't find any matching results</div>
                <div id="pnf-3">Try searching again or go to <Link to="/">Amazoo's home page</Link>.</div>
            </div>
        </>
        )
    }
    
    return(
        <>
            <div id="pnf-master">
                <div id="pnf-1">SORRY</div>
                <div id="pnf-2">we couldn't find that page</div>
                <div id="pnf-3">Try searching or go to <Link to="/">Amazoo's home page</Link>.</div>
            </div>
        </>
    )
};

export default PageNotFound;