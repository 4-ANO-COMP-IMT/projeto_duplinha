import React from 'react'
import axios from 'axios'
import "bootstrap/dist/css/bootstrap.min.css";
import "@fortawesome/fontawesome-free/css/all.css";
import Cavalo from "../componentes/Cavalo"
import Cartao from "../componentes/Cartao"
import VerCavalo from "../componentes/VerCavalo"

class ExibeCavalos extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
    listaCavalos: null,
    carregando: true,
    erro: null,
    funcaoVerCavalo: null,
    textoBotao: "Ver Cavalo"
    }
  }

  acessaDados = async () => {
    this.setState({carregando: true, erro: null})
    axios.get('http://localhost:4000/cavalos')
    .then(response => {
      this.setState({ listaCavalos: response.data, carregando: false })
    })
    .catch(erro => {
      this.setState({ erro: erro.message, carregando: false })
    })
  }

  funcaoVerCavalo = () => alert('[Informações completas do cavalo]')


  render(){
    const { listaCavalos, carregando, erro } = this.state;

    if (carregando) {
      return(
        //container principal
        <div className="container border rounded mt-2">
        {/* linha para o título */}
        <div className="row border-bottom m-2">
          <h1 className="display-5 text-center">Cavalos</h1>
          <button onClick={this.acessaDados}
          className="btn btn-outline-primary w-100 mt-2">
          Atualizar
          </button>
        </div>
        {/* linha para o primeiro cavalo */}
        <div className="row">
          {/* controle de colunas para responsividade */}
          <div className="col-sm-8 col-md-6 m2">
          {<Cartao>
              Carregando...
            </Cartao>}
          </div>
        </div>
      </div>
    );
    }

    else if (erro) {
      return (
        <div>Erro: {erro}
          <div>
          <button onClick={this.acessaDados}
          className="btn btn-outline-primary w-20 mt-2">
          Atualizar
          </button>
          </div>
        </div>
      );
    }

    else{
      return (
        //container principal
        <div className="container border rounded mt-2">
        {/* linha para o título */}
        <div className="row border-bottom m-2">
          <h1 className="display-5 text-center">Cavalos</h1>
          <button onClick={this.acessaDados}
          className="btn btn-outline-primary w-100 mt-2">
          Atualizar
          </button>
        </div>
        {/* linha para o primeiro cavalo */}
        <div className="row">
          {/* controle de colunas para responsividade */}
          <div className="col-sm-8 col-md-6 m2">
           {listaCavalos.map((cavalo) => (
             <Cartao>
               {/*Cavalo é o props.children do Cartao */}
               <Cavalo 
               icone="fa-solid fa-horse-head fa-2x"
               nome={cavalo.infos.nome}
               baia={cavalo.infos.baia}
               pelagem={cavalo.infos.pelagem}
               />
               {/*Mais um que será passado via children é o componenteVerCavalo */}
               <VerCavalo textoBotao={this.state.textoBotao} funcaoVerCavalo={this.funcaoVerCavalo} />
             </Cartao>
           ))}
          </div>
        </div>
      </div>
     );
    }
  }
}

export default ExibeCavalos;
