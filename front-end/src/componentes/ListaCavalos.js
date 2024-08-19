import React, { Component } from 'react';
import axios from 'axios';
import CartaoSelecao from './CartaoSelecao';
import Cavalo from './Cavalo';

class ListaCavalos extends Component {
  constructor(props) {
    super(props);
    this.state = {
      cavalosCadastrados: [],
      cavalosSelecionados: [],
    };
  }

  componentDidMount() {
    axios.get('http://localhost:4000/cavalos')
      .then(response => {
        this.setState({ cavalosCadastrados: response.data });
      })
      .catch(error => {
        console.error('Erro ao carregar cavalos:', error);
      });
  }

  handleCheckboxChange = (cavaloId) => {
    this.setState(prevState => {
      const { cavalosSelecionados } = prevState;
      const isSelecionado = cavalosSelecionados.includes(cavaloId);
      const novosSelecionados = isSelecionado
        ? cavalosSelecionados.filter(id => id !== cavaloId)
        : [...cavalosSelecionados, cavaloId];

      return { cavalosSelecionados: novosSelecionados };
    });
  };



  render() {
    return (
      <div className="lista-cavalos-container">
        <div className="cavalos-cadastrados">
          {this.state.cavalosCadastrados.map(cavalo => (
            <CartaoSelecao
            selecionado={this.state.cavalosSelecionados.includes(cavalo.idCavalo)}
            onClick={() => this.handleCheckboxChange(cavalo.idCavalo)}
            nome={cavalo.infos.nome}
            >
            </CartaoSelecao>
          ))}
        </div>
      </div>
    );
  }
}

export default ListaCavalos;
