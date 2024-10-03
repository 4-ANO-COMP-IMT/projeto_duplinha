import React, { Component } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';
import '../css/ExibeCadastro.css';

class ExibeProprietario extends Component {
  constructor(props) {
    super(props);
    this.state = {
      proprietario: null,
      carregando: true,
      erro: null,
    };
  }

  componentDidMount() {
    const { idProprietario } = this.props.params;

    axios.get('http://proprietarios-clusterip-service:5000/proprietarios')
      .then(response => {
        const proprietario = response.data;
        const proprietarioSelecionado = proprietario.find(proprietario => proprietario.idProprietario === idProprietario);

        if (proprietarioSelecionado) {
          this.setState({ proprietario: proprietarioSelecionado, carregando: false });
        } else {
          this.setState({ erro: "Proprietário não encontrado", carregando: false });
        }
      })
      .catch(() => {
        this.setState({ erro: "Erro ao carregar dados dos proprietários", carregando: false });
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
    const { proprietario, carregando, erro } = this.state;

    if (carregando) {
      return <div>Carregando...</div>;
    }

    if (erro) {
      return <div>{erro}</div>;
    }

    return (
        <div className="exibe-cadastro-container">
        <h1 className="exibe-cadastro-title">{proprietario.infos.nome + " " + proprietario.infos.sobrenome}</h1>
        <div className="exibe-cadastro-info">
          <p><strong>CPF:</strong> {proprietario.infos.cpf}</p>
          <p><strong>Gênero:</strong> {proprietario.infos.genero}</p>
          <p><strong>Idade:</strong> {this.calcularIdade(proprietario.infos.dt_nasc)} anos</p>
          <p><strong>Telefone:</strong> {proprietario.infos.telefone}</p>
          <p><strong>Logradouro:</strong> {proprietario.infos.endereco.logradouro}</p>
          <p><strong>Complemento:</strong> {proprietario.infos.endereco.complemento}</p>
          <p><strong>Cidade:</strong> {proprietario.infos.endereco.cidade}</p>
          <p><strong>Estado:</strong> {proprietario.infos.endereco.estado}</p>
          <p><strong>E-mail:</strong> {proprietario.infos.email}</p>
          <p><strong>Nome do contato de emergência:</strong> {proprietario.infos.nomeContatoEmergencia}</p>
          <p><strong>Telefone do contato de emergência:</strong> {proprietario.infos.telefoneContatoEmergencia}</p>
          <p><strong>Cavalos:</strong> {proprietario.infos.id_cavalos} </p>
        </div>
      </div>
    );
  }
}

const ExibeProprietarioComParametros = (props) => {
  const params = useParams();
  return <ExibeProprietario {...props} params={params} />;
}

export default ExibeProprietarioComParametros;
