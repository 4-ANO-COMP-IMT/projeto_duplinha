import React from 'react';
import axios from 'axios';
import "@fortawesome/fontawesome-free/css/all.css";
import ListaCavalos from '../componentes/ListaCavalos';
import '../css/Cadastro.css';
import { useNavigate } from 'react-router-dom';

class CadastraProprietario extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      nome: null,
      sobrenome: null,
      cpf: null,
      genero: null,
      dtNasc: null,
      telefone: null,
      logradouro: null,
      complemento: null,
      cidade: null,
      estado: null,
      email: null,
      nomeContatoEmergencia: null,
      telefoneContatoEmergencia: null,
      cavalosCadastrados:[],
      cavalosSelecionados:[],
    };
  }

  defaultState = {
    nome: null,
    sobrenome: null,
    cpf: null,
    genero: null,
    dtNasc: null,
    telefone: null,
    logradouro: null,
    complemento: null,
    cidade: null,
    estado: null,
    email: null,
    nomeContatoEmergencia: null,
    telefoneContatoEmergencia: null,
    cavalosCadastrados:[],
    cavalosSelecionados: [],
    erro: null,
  };


  handleChange = (e) => {
      this.setState({ [e.target.name]: e.target.value });
      };

  render() {
    const navigate = this.props.navigate;

    const handleSendData = (e) => {
        e.preventDefault();
    
        const novoProprietario = {
          nome: this.state.nome,
          sobrenome: this.state.sobrenome,
          cpf: this.state.cpf,
          genero: this.state.genero,
          dt_nasc: this.state.dtNasc,
          telefone: this.state.telefone,
          endereco:{
            logradouro: this.state.logradouro,
            complemento: this.state.complemento,
            cidade: this.state.cidade,
            estado: this.state.estado,
          },
          email: this.state.email,
          nomeContatoEmergencia: this.state.nomeContatoEmergencia,
          telefoneContatoEmergencia: this.state.telefoneContatoEmergencia,
          id_cavalos: this.listaCavalosRef.state.cavalosSelecionados,
        };

        axios.post('http://localhost:5000/proprietarios', novoProprietario)
          .then(response => {
            console.log('Proprietário cadastrado com sucesso:', response.data);
            this.setState(this.defaultState);
            this.listaCavalosRef.setState({ cavalosSelecionados: [] });
            navigate('/proprietarios');
          })
          .catch(error => {
            console.error('Erro ao cadastrar o proprietário:', error);
          });
    }

    return (
        <div className="cadastro-container">
          <h1 className="cadastro-title">Cadastrar Novo Proprietário</h1>
          <h2 className="cadastro-internal-title">Selecione seus cavalos</h2>
          <form onSubmit={handleSendData}>
          <ListaCavalos ref={ref => (this.listaCavalosRef = ref)} />
          <div className="form-group">
            <label>Nome:</label>
                <input
                type="text"
                className="form-control"
                name="nome"
                value={this.state.nome}
                onChange={this.handleChange}
                required
                />
            </div>
            <div className="form-group">
              <label>Sobrenome:</label>
              <input
                type="text"
                className="form-control"
                name="sobrenome"
                value={this.state.sobrenome}
                onChange={this.handleChange}
                required
              />
            </div>
            <div className="form-group">
              <label>CPF:</label>
              <input
                type="number"
                className="form-control"
                name="cpf"
                value={this.state.cpf}
                onChange={this.handleChange}
                required
              />
            </div>
            <div className="form-group">
              <label>Gênero:</label>
              <input
                type="text"
                className="form-control"
                name="genero"
                value={this.state.genero}
                onChange={this.handleChange}
                required
              />
            </div>
            <div className="form-group">
              <label>Data de Nascimento:</label>
              <input
                type="date"
                className="form-control"
                name="dtNasc"
                value={this.state.dtNasc}
                onChange={this.handleChange}
                required
              />
            </div>
            <div className="form-group">
              <label>Telefone:</label>
              <input
                type="tel"
                placeholder="(00) 90000-0000"
                className="form-control"
                name="telefone"
                value={this.state.telefone}
                onChange={this.handleChange}
                required
              />
            </div>
            <h2 className="cadastro-internal-title">Endereço</h2>
            <div className="form-subgroup">
              <label>Logradouro:</label>
              <input
                type="text"
                className="form-control"
                name="logradouro"
                value={this.state.logradouro}
                onChange={this.handleChange}
                required
              />
            </div>
            <div className="form-subgroup">
              <label>Complemento:</label>
              <input
                type="text"
                className="form-control"
                name="complemento"
                value={this.state.complemento}
                onChange={this.handleChange}
              />
            </div>
            <div className="form-subgroup">
              <label>Cidade:</label>
              <input
                type="text"
                className="form-control"
                name="cidade"
                value={this.state.cidade}
                onChange={this.handleChange}
                required
              />
            </div>
            <div className="form-subgroup">
              <label>Estado:</label>
              <input
                type="text"
                className="form-control"
                name="estado"
                value={this.state.estado}
                onChange={this.handleChange}
                required
              />
            </div>
            <div className="form-group">
              <label>E-mail:</label>
              <input
                type="email"
                className="form-control"
                name="email"
                value={this.state.email}
                onChange={this.handleChange}
                required
              />
            </div>
            <div className="form-group">
              <label>Nome do contato de emergência:</label>
              <input
                type="text"
                className="form-control"
                name="nomeContatoEmergencia"
                value={this.state.nomeContatoEmergencia}
                onChange={this.handleChange}
                required
              />
            </div>
            <div className="form-group">
              <label>Telefone do contato de emergência:</label>
              <input
                type="tel"
                className="form-control"
                name="telefoneContatoEmergencia"
                value={this.state.telefoneContatoEmergencia}
                onChange={this.handleChange}
                required
              />
            </div>
            <button type="submit" className="cadastro-button">
              Cadastrar
            </button>
          </form>
        </div>
      );
  }
}

export default function(props) {
  const navigate = useNavigate();
  return <CadastraProprietario {...props} navigate={navigate} />;
}