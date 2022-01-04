import React from 'react'

function App() {
  return (
    <div className="App" style={{ backgroundColor: 'red', color: 'white' }}>
      rama de desarrolloooooo: {process.env.REACT_APP_ENV}
      prueba de klexfer
      <p>{process.env.REACT_APP_COMPANIA}</p>
    </div>
  );
}

export default App;
