import React from 'react'

function App() {
  return (
    <div className="App" style={{ backgroundColor: 'red', color: 'white' }}>
      rama de desarrolloooooo: {process.env.REACT_APP_ENV}
    </div>
  );
}

export default App;
