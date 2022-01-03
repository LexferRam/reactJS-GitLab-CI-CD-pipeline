import './App.css';
import React from 'react'

function App() {
  return (
    <div className="App">
      rama de produccion:: {process.env.REACT_APP_ENV}
    </div>
  );
}

export default App;
