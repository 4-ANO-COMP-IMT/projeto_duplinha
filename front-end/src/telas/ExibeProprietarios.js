import React from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import "@fortawesome/fontawesome-free/css/all.css";
import "../css/ExibeItens.css";
import Proprietario from "../componentes/Proprietario";
import Cartao from "../componentes/Cartao";
import VerItem from "../componentes/VerItem";

class ExibeProprietarios extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      listaProprietarios: null,
      carregando: true,
      erro: null,
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

  render() {
    const { listaProprietarios, carregando, erro } = this.state;

    const navigate = this.props.navigate;

    const handleCadastroProprietario = () => {
      navigate('/cadastra-proprietario');
    }

    const handleExibeProprietario = (idProprietario) => {
      navigate(`/proprietario/${idProprietario}`);
    }
  
    if (carregando) {
      return (
        <div className="exibe-itens-container">
          <div className="exibe-itens-header">
            <h1 className="exibe-itens-title">Proprietários</h1>
            <button onClick={this.acessaDados} className="exibe-itens-button">
              Atualizar
            </button>
            <button onClick={handleCadastroProprietario} className='exibe-itens-button'>
              Cadastrar proprietário
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
            <button onClick={handleCadastroProprietario} className='exibe-itens-button'>
              Cadastrar proprietário
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
            <button onClick={handleCadastroProprietario} className='exibe-itens-button'>
              Cadastrar proprietário
            </button>
          </div>
          <div className="exibe-itens-list">
            {listaProprietarios.map((proprietario) => (
              <Cartao key={proprietario.idProprietario}>
                <Proprietario
                  icone={"fa-solid fa-user fa-2x"}
                  nome={proprietario.infos.nome + " " + proprietario.infos.sobrenome}
                  telefone={proprietario.infos.telefone}
                  email={proprietario.infos.email}
                />
                <VerItem textoBotao={this.state.textoBotao} funcaoVerItem={() => handleExibeProprietario(proprietario.idProprietario)} />
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
  return <ExibeProprietarios {...props} navigate={navigate} />;
}
