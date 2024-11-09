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

    axios.get('http://localhost:31661/cavalos')
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
        this.setState({ erro: "Erro ao carregar dados dos cavalos", carregando: false });
      });
  }

  calcularIdade = (dataNascimento) => {
    const hoje = new Date();
    const nascimento = new Date(dataNascimento);
    let idade = hoje.getFullYear() - nascimento.getFullYear();
    const mes = hoje.getMonth() - nascimento.getMonth();

    // Ajusta a idade se o aniversário ainda não tiver ocorrido no ano atual
    if (mes < 0 || (mes === 0 && hoje.getDate() < nascimento.getDate())) {
      idade--;
    }

    return idade;
  };

  escreveSexo = (sexo) => {
    if(sexo === "F"){
        return "Fêmea"
    } else {
        return "Macho"
    }
  }

  escreveRegistro = (numReg, tipoReg) => {
    if(tipoReg === "Provisório"){
        return numReg + "/P"
    } else if (tipoReg === "Definitivo"){
        return numReg + "/D"
    } else {
        return "Sem registro"
    }
  }

  escreveBaia = (baia) => {
    if(baia !== null){
        return baia
    } else {
        return "Pasto"
    }
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
        <h1 className="exibe-cadastro-title">{cavalo.infos.nome}</h1>
        <div className="exibe-cadastro-info">
          <p><strong>Raça:</strong> {cavalo.infos.raca}</p>
          <p><strong>Idade:</strong> {this.calcularIdade(cavalo.infos.dt_nasc)} anos</p>
          <p><strong>Pelagem:</strong> {cavalo.infos.pelagem}</p>
          <p><strong>Sexo:</strong> {this.escreveSexo(cavalo.infos.sexo)}</p>
          <p><strong>Castrado:</strong> {cavalo.infos.castrado}</p>
          <p><strong>Registro:</strong> {this.escreveRegistro(cavalo.infos.num_reg, cavalo.infos.tipo_reg)}</p>
          <p><strong>Chip:</strong> {cavalo.infos.num_chip ? cavalo.infos.num_chip : "Não possui chip"}</p>
          <p><strong>Baia:</strong> {this.escreveBaia(cavalo.infos.baia)}</p>
          <p><strong>Proprietários:</strong> {cavalo.infos.id_proprietarios} </p>
        </div>
      </div>
    );
  }
}

const ExibeCavaloComParametros = (props) => {
  const params = useParams();
  return <ExibeCavalo {...props} params={params} />;
}

export default ExibeCavaloComParametros;
