import './App.css';
import React from 'react'

function App() {
  return (
    <div className="App">
      rama de produccion::
      <p>{process.env.REACT_APP_ENV}</p>
      <p>{process.env.REACT_APP_COMPANIA}</p>
      lexfer ramirez
    </div>
  );
}

export default App;
