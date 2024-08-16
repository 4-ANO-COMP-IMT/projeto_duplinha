import React from 'react';
import './Cavalo.css';

const Cavalo = (props) => {
  return (
    <div className="cavalo">
      <div className="cavalo-icone">
        <i className={props.icone}></i>
      </div>
      <div className="cavalo-detalhes">
        <h4 className="cavalo-nome">{props.nome}</h4>
        <p className="cavalo-info">Baia: {props.baia}</p>
        <p className="cavalo-info">Pelagem: {props.pelagem}</p>
      </div>
    </div>
  );
}

export default Cavalo;
