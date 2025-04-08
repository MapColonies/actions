// example.ts

// A simple function to greet a person
function greet(name: string): string {
    return `Hello, ${name}!`;
  }
  
  // An unused variable to demonstrate ESLint's no-unused-vars rule
  const unusedVariable = 'I am not used';
  
  // Calling the greet function
  console.log(greet('World'));
