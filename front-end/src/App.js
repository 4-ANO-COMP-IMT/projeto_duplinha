import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Sidebar from './componentes/Sidebar';
import ExibeCavalos from './telas/ExibeCavalos';
import ExibeProprietarios from './telas/ExibeProprietarios';
import CadastraCavalo from './telas/CadastraCavalo';
import CadastraProprietario from './telas/CadastraProprietario';
import ExibeCavalo from './telas/ExibeCavalo';
import ExibeProprietario from './telas/ExibeProprietario';
import './css/App.css';

const App = () => {
  return (
    <Router>
      <div className="app">
        <Sidebar />
        <div className="content">
          <Routes>
            <Route path="/" element={<ExibeCavalos />} />
            <Route path="/proprietarios" element={<ExibeProprietarios />} />
            <Route path="/cadastra-cavalo" element={<CadastraCavalo />} />
            <Route path="/cadastra-proprietario" element={<CadastraProprietario />} />
            <Route path="/cavalo/:idCavalo" element={<ExibeCavalo />} />
            <Route path="/proprietario/:idProprietario" element={<ExibeProprietario />} />
          </Routes>
        </div>
      </div>
    </Router>
  );
};

export default App;
