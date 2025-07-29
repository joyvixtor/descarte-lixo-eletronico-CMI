import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';

function App() {
  return (
    <div className="App">
      <div className="container mt-5">
        <h1 className="text-center mb-4">Sistema de Descarte de Lixo Eletrônico</h1>
        <div className="row justify-content-center">
          <div className="col-md-6">
            <div className="card">
              <div className="card-body">
                <h5 className="card-title">Bem-vindo ao Sistema CMI</h5>
                <p className="card-text">
                  Este é o ambiente de desenvolvimento inicial do sistema de descarte de produtos eletrônicos.
                </p>
                <button className="btn btn-primary">Começar</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default App;
