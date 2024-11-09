import React from 'react';
import '../css/VerItem.css';

const VerItem = (props) => {
  return (
    <div className='ver-item'>
      <button
        type='button'
        onClick={props.funcaoVerItem}
        className='ver-item-botao'>
        {props.textoBotao}
      </button>
    </div>
  );
}

export default VerItem;
