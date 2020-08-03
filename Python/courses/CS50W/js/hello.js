function hello() {
  alert('Hello, world!');
}

function trans() {
  let heading = document.querySelector('h1');
  if (heading.innerHTML === 'Hello!') {
    heading.innerHTML = 'Goodbye!';
  } else {
    heading.innerHTML = 'Hello!';
  };
};

document.addEventListener('DOMContentLoaded', function() {

  document.querySelector('form').onsubmit = function() {
    const name = document.querySelector('#name').value;
    alert(`Hello, ${name}!`);
  };

});