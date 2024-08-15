import React from 'react'

const Cartao = (props) => {
    return(
        <div className='card'>
            {/*Corpo do cartão*/}
            <div className='card-body'>
                {props.children}
            </div>
        </div>
    )
}

export default Cartao