import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Sidebar from './componentes/Sidebar';
import ExibeCavalos from './telas/ExibeCavalos';
import ExibeProprietarios from './telas/ExibeProprietarios';

const App = () => {
  return (
    <Router>
      <div className="app">
        <Sidebar />
        <div className="content">
          <Routes>
            <Route path="/" element={<ExibeCavalos />} />
            <Route path="/proprietarios" element={<ExibeProprietarios />} />
          </Routes>
        </div>
      </div>
    </Router>
  );
};

export default App;
