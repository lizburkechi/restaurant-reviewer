import React, {useState, useEffect} from "react";
import axios from 'axios';

const Restaurant = (props) => {
    const [restaurant, setRestaurant] = useState({});
    const [revew, setReview] = useState({});

    useEffect(()=> {
        const slug = props.match.params.slug
        const url = `/api/v1/restaurants/${slug}`

        axios.get(url)
        .then( response => setRestaurant(response.data))
        .catch(response => console.log(response))
    }, [])

    return (
    <div className="wrapper">
        <div className="column">
            <div className="header"></div>
            <div className="reviews"></div>
        </div>
    </div>
    )
}

export default Restaurant