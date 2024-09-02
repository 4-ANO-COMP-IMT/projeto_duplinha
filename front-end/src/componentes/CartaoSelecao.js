import React, { useState } from 'react';
import '../css/CartaoSelecao.css';
import '../css/CavaloSelecao.css';

const CartaoSelecao = (props) => {
    return (
        <div 
        className={`cartao ${props.selecionado ? 'selecionado' : ''}`} 
        onClick={props.onClick}
        >
        <div className='cartao-corpo'>
            <div className="cavalo-selecao">
            <div className="cavalo-selecao-icone">
                <i className="fa-solid fa-horse-head"></i>
            </div>
            <div className="cavalo-selecao-detalhes">
                <h4 className="cavalo-selecao-nome">{props.nome}</h4>
            </div>
            </div>
        </div>
        <input 
        type="checkbox" 
        checked={props.selecionado} 
        onChange={props.onClick} 
        className="cartao-checkbox"
        />
        </div>
    );
}

export default CartaoSelecao;
