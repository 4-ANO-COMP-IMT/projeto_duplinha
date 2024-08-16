import React from 'react';
import '../css/Item.css';

const Item = (props) => {
  return (
    <div className="item">
      <div className="item-icone">
        <i className={props.icone}></i>
      </div>
      <div className="item-detalhes">
        <h4 className="item-nome">{props.nome}</h4>
        <p className="item-info">Baia: {props.baia}</p>
        <p className="item-info">Pelagem: {props.pelagem}</p>
      </div>
    </div>
  );
}

export default Item;
