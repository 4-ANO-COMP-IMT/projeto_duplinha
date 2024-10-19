import React from 'react';
import axios from 'axios';
import "@fortawesome/fontawesome-free/css/all.css";
import '../css/Cadastro.css';
import { useNavigate } from 'react-router-dom';

class CadastraCavalo extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      nome: null,
      raca: null,
      dtNasc: null,
      pelagem: null,
      castrado: null,
      sexo: null,
      registro_tp: null,
      registro_num: null,
      chip: null,
      baia: null,
      id_proprietarios: []
    };
  }

  defaultState = {
    nome: null,
    raca: null,
    dtNasc: null,
    pelagem: null,
    castrado: null,
    sexo: null,
    registro_tp: null,
    registro_num: null,
    chip: null,
    baia: null,
    id_proprietarios: []
  };

    handleChange = (e) => {
        this.setState({ [e.target.name]: e.target.value });
        };

  render() {
    const navigate = this.props.navigate;

    const handleSendData = (e) => {
        e.preventDefault();
    
        const novoCavalo = {
            nome: this.state.nome,
            raca: this.state.raca,
            dt_nasc: this.state.dtNasc,
            pelagem: this.state.pelagem,
            castrado: this.state.castrado,
            sexo: this.state.sexo,
            num_reg: this.state.registro_num,
            num_chip: this.state.chip,
            tipo_reg: this.state.registro_tp,
            baia: this.state.baia,
            id_proprietarios: this.state.id_proprietarios
        };

        axios.post('http://localhost:31661/cavalos', novoCavalo)
        .then(response => {
            console.log('Cavalo cadastrado com sucesso:', response.data);
            this.setState(this.defaultState);
            navigate('/');
        })
        .catch(error => {
            console.error('Erro ao cadastrar novo cavalo:', error);
        });

    }
    

    return (
        <div className="cadastro-container">
          <h1 className="cadastro-title">Cadastrar Novo Cavalo</h1>
          <form onSubmit={handleSendData}>
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
              <label>Raça:</label>
              <input
                type="text"
                className="form-control"
                name="raca"
                value={this.state.raca}
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
              <label>Pelagem:</label>
              <input
                type="text"
                className="form-control"
                name="pelagem"
                value={this.state.pelagem}
                onChange={this.handleChange}
                required
              />
            </div>
            <div className="form-radio-button">
            <label>Castrado?</label>
            <div>
                <input
                type="radio"
                id="castradoSim"
                name="castrado"
                value="Sim"
                checked={this.state.castrado === "Sim"}
                onChange={this.handleChange}
                required
                />
                <label htmlFor="castradoSim">Sim</label>

                <input
                type="radio"
                id="castradoNao"
                name="castrado"
                value="Não"
                checked={this.state.castrado === "Não"}
                onChange={this.handleChange}
                style={{ marginLeft: '20px' }}
                required
                />
                <label htmlFor="castradoNao">Não</label>
            </div>
            </div>
            <div className="form-radio-button">
            <label>Sexo</label>
            <div>
                <input
                type="radio"
                id="sexoFemea"
                name="sexo"
                value="F"
                checked={this.state.sexo === 'F'}
                onChange={this.handleChange}
                required
                />
                <label htmlFor="sexoFemea">Fêmea</label>

                <input
                type="radio"
                id="sexoMacho"
                name="sexo"
                value="M"
                checked={this.state.sexo === 'M'}
                onChange={this.handleChange}
                style={{ marginLeft: '20px' }}
                required
                />
                <label htmlFor="sexoMacho">Macho</label>
            </div>
            </div>
            <div className="form-radio-button">
            <label>Tipo de Registro</label>
            <div>
                <input
                type="radio"
                id="registroProvisorio"
                name="registro_tp"
                value="Provisório"
                checked={this.state.registro_tp === 'Provisório'}
                onChange={this.handleChange}
                />
                <label htmlFor="registroProvisorio">Provisório</label>

                <input
                type="radio"
                id="registroDefinitivo"
                name="registro_tp"
                value="Definitivo"
                checked={this.state.registro_tp === 'Definitivo'}
                onChange={this.handleChange}
                style={{ marginLeft: '20px' }}
                />
                <label htmlFor="registroDefinitivo">Definitivo</label>
            </div>
            </div>
            <div className="form-group">
              <label>Número Registro:</label>
              <input
                type="number"
                className="form-control"
                name="registro_num"
                value={this.state.registro_num}
                onChange={this.handleChange}
              />
            </div>
            <div className="form-group">
              <label>Chip:</label>
              <input
                type="number"
                className="form-control"
                name="chip"
                value={this.state.chip}
                onChange={this.handleChange}
              />
            </div>
            <div className="form-group">
              <label>Baia:</label>
              <input
                type="text"
                className="form-control"
                name="baia"
                value={this.state.baia}
                onChange={this.handleChange}
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
  return <CadastraCavalo {...props} navigate={navigate} />;
}