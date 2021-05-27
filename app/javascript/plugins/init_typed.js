import Typed from 'typed.js';

let options = {
  strings: [
    '',
    'Open your restaurant anywhere',
    'Earn money as a Chef_Space host',
    'Search below and find spaces near you'
    ],
  typeSpeed: 30,
  fadeOut: true,
  showCursor: false,
  startDelay: 500
}

let initTyped = () => new Typed('#banner-text-typed', options);

export { initTyped }
