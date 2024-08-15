import React from 'react'

const VerCavalo = (props) => {
    return(
        <div className='d-flex justify-content-evenly m-2'>
            <button
            type='button'
            onClick={props.funcaoVerCavalo}
            className='btn btn-primary'>{props.textoBotao}
            </button>
        </div>
    )
}

export default VerCavalo