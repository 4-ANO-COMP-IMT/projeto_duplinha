import React, { Component } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';
import '../css/ExibeCadastro.css';

class ExibeCavalo extends Component {
  constructor(props) {
    super(props);
    this.state = {
      cavalo: null,
      carregando: true,
      erro: null,
    };
  }

  componentDidMount() {
    const { idCavalo } = this.props.params;

    axios.get('http://localhost:4000/cavalos')
      .then(response => {
        const cavalos = response.data;
        const cavaloSelecionado = cavalos.find(cavalo => cavalo.idCavalo === idCavalo);

        if (cavaloSelecionado) {
          this.setState({ cavalo: cavaloSelecionado, carregando: false });
        } else {
          this.setState({ erro: "Cavalo não encontrado", carregando: false });
        }
      })
      .catch(() => {
        this.setState({ erro: "Erro ao carregar dados dos cavalos", loading: false });
      });
  }

  render() {
    const { cavalo, carregando, erro } = this.state;

    if (carregando) {
      return <div>Carregando...</div>;
    }

    if (erro) {
      return <div>{erro}</div>;
    }

    return (
      <div className="exibe-cadastro-container">
        <h1>{cavalo.infos.nome}</h1>
        <p>Raça: {cavalo.infos.raca}</p>
        <p>Idade: {cavalo.infos.idade}</p>
        <p>Sexo: {cavalo.infos.sexo}</p>
        <p>Castrado: {cavalo.infos.castrado ? 'Sim' : 'Não'}</p>
        {/* outros campos conforme necessário */}
      </div>
    );
  }
}

const ExibeCavaloComParametros = (props) => {
  const params = useParams();
  return <ExibeCavalo {...props} params={params} />;
}

export default ExibeCavaloComParametros;
