const path = require('path');
const fs = require('fs');
const { execFile } = require('child_process');

const watchedFile = './resistorInfo.asy';
const onlyName = path.parse(watchedFile).name;

console.log(`Watching for file changes on ${watchedFile}`);

fs.watchFile(watchedFile, { interval: 1000 }, (curr, prev) => {
  console.log(`${watchedFile} file Changed`);

  execFile('./generate', [onlyName], (err, stdout, stderr) => {
    if (err) {
      console.log(err);
    } else {
      console.log('Output generated correctly');
    }
  });

});


