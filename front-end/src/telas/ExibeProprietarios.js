import React from 'react';
import axios from 'axios';
import "@fortawesome/fontawesome-free/css/all.css";
import "../css/ExibeItens.css"; // Arquivo CSS para estilização
import Item from "../componentes/Item";
import Cartao from "../componentes/Cartao";
import VerItem from "../componentes/VerItem";

class ExibeProprietarios extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      listaProprietarios: null,
      carregando: true,
      erro: null,
      funcaoVerItem: null,
      textoBotao: "Ver Proprietário"
    };
  }

  acessaDados = async () => {
    this.setState({ carregando: true, erro: null });
    axios.get('http://localhost:5000/proprietarios')
      .then(response => {
        this.setState({ listaProprietarios: response.data, carregando: false });
      })
      .catch(erro => {
        this.setState({ erro: erro.message, carregando: false });
      });
  }

  funcaoVerItem = () => alert('[Informações completas do proprietário]');

  render() {
    const { listaProprietarios, carregando, erro } = this.state;

    if (carregando) {
      return (
        <div className="exibe-itens-container">
          <div className="exibe-itens-header">
            <h1 className="exibe-itens-title">Proprietários</h1>
            <button onClick={this.acessaDados} className="exibe-itens-button">
              Atualizar
            </button>
          </div>
          <div className="exibe-itens-loading">
            <Cartao>Carregando...</Cartao>
          </div>
        </div>
      );
    } else if (erro) {
      return (
        <div className="exibe-itens-container">
          <div className="exibe-itens-header">
            <h1 className="exibe-itens-title">Erro</h1>
            <p>{erro}</p>
            <button onClick={this.acessaDados} className="exibe-itens-button">
              Atualizar
            </button>
          </div>
        </div>
      );
    } else {
      return (
        <div className="exibe-itens-container">
          <div className="exibe-itens-header">
            <h1 className="exibe-itens-title">Proprietários</h1>
            <button onClick={this.acessaDados} className="exibe-itens-button">
              Atualizar
            </button>
          </div>
          <div className="exibe-itens-list">
            {listaProprietarios.map((proprietario) => (
              <Cartao key={proprietario.idProprietario}>
                <Item
                  icone="fa-solid fa-horse-head fa-2x"
                  nome={proprietario.infos.nome + " " + proprietario.infos.sobrenome}
                  baia={proprietario.infos.telefone}
                  pelagem={proprietario.infos.email}
                />
                <VerItem textoBotao={this.state.textoBotao} funcaoVerItem={this.funcaoVerItem} />
              </Cartao>
            ))}
          </div>
        </div>
      );
    }
  }
}

export default ExibeProprietarios;
