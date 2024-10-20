import React from 'react';
import { NavLink } from 'react-router-dom';
import '../css/Sidebar.css'; // Importando o CSS para estilização

const Sidebar = () => {
  return (
    <div className="sidebar">
      <h2 className="sidebar-title">Menu</h2>
      <nav className="sidebar-nav">
        <NavLink to="/" exact className="sidebar-link" activeClassName="active-link">
          Cavalos
        </NavLink>
        <NavLink to="/proprietarios" className="sidebar-link" activeClassName="active-link">
          Proprietários
        </NavLink>
        {/* Outras telas se houver */}
      </nav>
    </div>
  );
};

export default Sidebar;
