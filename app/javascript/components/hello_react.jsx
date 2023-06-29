import React from 'react'
import ReactDOM from 'react-dom/client'
import App from '../components/App'

document.addEventListener('DOMContentLoaded', () => {
  const root = ReactDOM.createRoot(
      document.body.appendChild(document.createElement('div'))
  );

  root.render(<App />);
})
