import React from 'react';
import axios from 'axios';
import "@fortawesome/fontawesome-free/css/all.css";
import "../css/ExibeItens.css";
import { useNavigate } from 'react-router-dom';
import Cavalo from "../componentes/Cavalo";
import Cartao from "../componentes/Cartao";
import VerItem from "../componentes/VerItem";

class ExibeCavalos extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      listaCavalos: null,
      carregando: true,
      erro: null,
      funcaoVerItem: null,
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

  funcaoVerItem = () => alert('[Informações completas do cavalo]');

  render() {
    const { listaCavalos, carregando, erro } = this.state;
    const navigate = this.props.navigate;

    const handleCadastroCavalo = () => {
      navigate('/cadastra-cavalo');
    }

    if (carregando) {
      return (
        <div className="exibe-itens-container">
          <div className="exibe-itens-header">
            <h1 className="exibe-itens-title">Cavalos</h1>
            <button onClick={this.acessaDados} className="exibe-itens-button">
              Atualizar
            </button>
            <button onClick={handleCadastroCavalo} className='exibe-itens-button'>
              Cadastrar cavalo
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
            <button onClick={handleCadastroCavalo} className='exibe-itens-button'>
              Cadastrar cavalo
            </button>
          </div>
        </div>
      );
    } else {
      return (
        <div className="exibe-itens-container">
          <div className="exibe-itens-header">
            <h1 className="exibe-itens-title">Cavalos</h1>
            <button onClick={this.acessaDados} className="exibe-itens-button">
              Atualizar
            </button>
            <button onClick={handleCadastroCavalo} className='exibe-itens-button'>
              Cadastrar cavalo
            </button>
          </div>
          <div className="exibe-itens-list">
            {listaCavalos.map((cavalo) => (
              <Cartao key={cavalo.idCavalo}>
                <Cavalo
                  icone="fa-solid fa-horse-head fa-2x"
                  nome={cavalo.infos.nome}
                  baia={cavalo.infos.baia}
                  pelagem={cavalo.infos.pelagem}
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

export default function(props) {
  const navigate = useNavigate();
  return <ExibeCavalos {...props} navigate={navigate} />;
}
