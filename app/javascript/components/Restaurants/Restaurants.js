import React, { useState, useEffect } from "react";
import axios from 'axios';
import Restaurant from "./Restaurant";
import styled from 'styled-components';

const AppHome = styled.div`
text-align: center;
max-width: 1200px;
margin-left: auto;
margin-right: auto;
`

const Header = styled.div`
padding: 100px 100px 10px 100px;
h1 {
    font-size: 42px;
}
`
const Subheader = styled.div`
font-weight: 300;
font-size: 26px;
`
const Grid = styled.div`
display: grid;
grid-template-columns: repeat(4, 1fr);
grid-gap: 20px;
width: 100%;
padding: 20px;
`

const Restaurants = () => {
    const [restaurants, setRestaurants] = useState([])

    useEffect(()=> {
        axios.get('/api/v1/restaurants.json')
        .then(response => {setRestaurants(response.data.data)})
        .catch(response => console.log(response))
    }, [restaurants.length])

    const grid = restaurants.map( rest => {
        return (
        <Restaurant 
        key={rest.attributes.name}
        attributes={rest.attributes}
        /> 
        )
    })

    return (
        <AppHome>
            <Header>
                <h1>ReviewApp</h1>
                <Subheader>Tell us what's good.</Subheader>
            </Header>
            <Grid>
                {grid} 
            </Grid>
        </AppHome>
    )
}

export default Restaurants;