import React from 'react';
import '../css/Proprietario.css';

const Proprietario = (props) => {
  return (
    <div className="proprietario">
      <div className="proprietario-icone">
        <i className={props.icone}></i>
      </div>
      <div className="proprietario-detalhes">
        <h4 className="proprietario-nome">{props.nome}</h4>
        <p className="proprietario-info">Telefone: {props.telefone}</p>
        <p className="proprietario-info">E-mail: {props.email}</p>
      </div>
    </div>
  );
}

export default Proprietario;
