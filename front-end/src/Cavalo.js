import React from 'react'
import ReactDOM from 'react-dom'

//Ao invés de props, pode-se colocar um json com os atributos direto: Pedido = ({icone, titulo, descricao}) 
//e só passar esses parâmetros no corpo da função
const Cavalo = (props) => {
    return(
      <div className="d-flex">
        <div className="d-flex align-items-center">
          <i className={props.icone}></i>
        </div>
        {/** flex-grow 1: tomar todo o espaço remanescente */}
        <div className="flex-grow-1 ms-2 border">
          <h4 className="text-center">{props.nome}</h4>
          <p className="text-center">Baia: {props.baia}</p>
          <p className="text-center">Pelagem: {props.pelagem}</p>
        </div>
      </div>
    )
}

export default Cavalo