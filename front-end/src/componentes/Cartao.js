import React from 'react';
import '../css/Cartao.css';

const Cartao = (props) => {
  return (
    <div className='cartao'>
      <div className='cartao-corpo'>
        {props.children}
      </div>
    </div>
  );
}

export default Cartao;
