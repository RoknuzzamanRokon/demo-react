import logo from './logo.svg';
import React, { useState } from 'react';
import './App.css';

function App() {
  const getRandomColor = () => {
    // Generate a random color
    return `#${Math.floor(Math.random() * 16777215).toString(16)}`;
  };

  const handleButtonClick = () => {
    // Change the body background color to a new random color on button click
    const randomColor = getRandomColor();
    document.body.style.backgroundColor = randomColor;
  };

  return (
    <div className="App">
      <h1>Hello, React!</h1>
      <button onClick={handleButtonClick}>Change Color</button>
    </div>
  );
}

export default App;
