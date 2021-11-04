import Typed from 'typed.js';

const typing = () => {
  console.log("coucou je suis dans le fichier typing");
  const options = {
    strings: ['<i>First</i> sentence.', '&amp; a second sentence.']
  };

  const typed = new Typed('#typed', {
    stringsElement: '#typed-strings',
    typeSpeed: 40,
    showCursor: false
  });
};

export { typing }
