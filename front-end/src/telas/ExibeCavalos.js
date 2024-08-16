import React from 'react';
import axios from 'axios';
import "../css/ExibeCavalos.css"; // Arquivo CSS para estilização
import Cavalo from "../componentes/Cavalo";
import Cartao from "../componentes/Cartao";
import VerCavalo from "../componentes/VerCavalo";

class ExibeCavalos extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      listaCavalos: null,
      carregando: true,
      erro: null,
      funcaoVerCavalo: null,
      textoBotao: "Ver Cavalo"
    };
  }

  acessaDados = async () => {
    this.setState({ carregando: true, erro: null });
    axios.get('http://localhost:4000/cavalos')
      .then(response => {
        this.setState({ listaCavalos: response.data, carregando: false });
      })
      .catch(erro => {
        this.setState({ erro: erro.message, carregando: false });
      });
  }

  funcaoVerCavalo = () => alert('[Informações completas do cavalo]');

  render() {
    const { listaCavalos, carregando, erro } = this.state;

    if (carregando) {
      return (
        <div className="exibe-cavalos-container">
          <div className="exibe-cavalos-header">
            <h1 className="exibe-cavalos-title">Cavalos</h1>
            <button onClick={this.acessaDados} className="exibe-cavalos-button">
              Atualizar
            </button>
          </div>
          <div className="exibe-cavalos-loading">
            <Cartao>Carregando...</Cartao>
          </div>
        </div>
      );
    } else if (erro) {
      return (
        <div className="exibe-cavalos-container">
          <div className="exibe-cavalos-header">
            <h1 className="exibe-cavalos-title">Erro</h1>
            <p>{erro}</p>
            <button onClick={this.acessaDados} className="exibe-cavalos-button">
              Atualizar
            </button>
          </div>
        </div>
      );
    } else {
      return (
        <div className="exibe-cavalos-container">
          <div className="exibe-cavalos-header">
            <h1 className="exibe-cavalos-title">Cavalos</h1>
            <button onClick={this.acessaDados} className="exibe-cavalos-button">
              Atualizar
            </button>
          </div>
          <div className="exibe-cavalos-list">
            {listaCavalos.map((cavalo) => (
              <Cartao key={cavalo.id}>
                <Cavalo
                  icone="fa-solid fa-horse-head fa-2x"
                  nome={cavalo.infos.nome}
                  baia={cavalo.infos.baia}
                  pelagem={cavalo.infos.pelagem}
                />
                <VerCavalo textoBotao={this.state.textoBotao} funcaoVerCavalo={this.funcaoVerCavalo} />
              </Cartao>
            ))}
          </div>
        </div>
      );
    }
  }
}

export default ExibeCavalos;
