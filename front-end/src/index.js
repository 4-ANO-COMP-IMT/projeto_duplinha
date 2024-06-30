import React, { useEffect, useState } from 'react'
import ReactDOM from "react-dom";
import axios from 'axios'
import "bootstrap/dist/css/bootstrap.min.css";
import "@fortawesome/fontawesome-free/css/all.css";
import Cavalo from "./Cavalo"
import Cartao from "./Cartao"
import VerCavalo from "./VerCavalo"

const App = () => {
  const funcaoVerCavalo = () => alert('[Informações completas do cavalo]')
  const textoBotao = "Ver Cavalo"
  const componenteVerCavalo = <VerCavalo textoBotao={textoBotao} funcaoVerCavalo={funcaoVerCavalo} />

  const nome1 = "Pingo"
  const baia1 = "7A"
  const pelagem1 = "Pampa de Tordilho"
  const nome2 = "Encanto ESR"
  const baia2 = "8A"
  const pelagem2 = "Alazã Amarilho"

  return (
     //container principal
     <div className="container border rounded mt-2">
     {/* linha para o título */}
     <div className="row border-bottom m-2">
       <h1 className="display-5 text-center">Cavalos</h1>
     </div>

     {/* linha para o primeiro cavalo */}
     <div className="row">
       {/* controle de colunas para responsividade */}
       <div className="col-sm-8 col-md-6 m2">
         <Cartao>
           {/*Cavalo é o props.children do Cartao */}
           <Cavalo 
           icone="fa-solid fa-horse-head fa-2x"
           nome={nome1}
           baia={baia1}
           pelagem={pelagem1}
           />
           {/*Mais um que será passado via children é o componenteVerCavalo */}
           {componenteVerCavalo}
         </Cartao>
       </div>
     </div>
     {/* linha para o segundo cavalo */}
     <div className="row">
       {/* controle de colunas para responsividade */}
       <div className="col-sm-8 col-md-6 m2">
         <Cartao>
           <Cavalo 
           icone="fa-solid fa-horse-head fa-2x"
           nome={nome2}
           baia={baia2}
           pelagem={pelagem2}
           />
           {/*Mais um que será passado via children é o componenteVerCavalo */}
           {componenteVerCavalo}
         </Cartao>
       </div>
     </div>
   </div>
  );
};

ReactDOM.render(<App />, document.querySelector("#root"));
