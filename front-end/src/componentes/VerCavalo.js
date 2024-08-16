import React from 'react';
import '../css/VerCavalo.css';

const VerCavalo = (props) => {
  return (
    <div className='ver-cavalo'>
      <button
        type='button'
        onClick={props.funcaoVerCavalo}
        className='ver-cavalo-botao'>
        {props.textoBotao}
      </button>
    </div>
  );
}

export default VerCavalo;
