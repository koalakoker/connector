const path = require('path');
const fs = require('fs');
const { execFile } = require('child_process');

const watchedFile = ['./resistorInfo.asy','./obj.asy'];
const onlyName = [];
watchedFile.forEach(file => {
  onlyName.push(path.parse(file).name);
});

console.log(`Watching for file changes on ${watchedFile}`);

function fileChanged(curr, prev) {
  console.log(`${watchedFile} file Changed`);

  execFile('./generate', [onlyName[0]], (err, stdout, stderr) => {
    if (err) {
      console.log(err);
    } else {
      console.log('Output generated correctly');
    }
  });

}

fs.watchFile(watchedFile[0], { interval: 1000 }, fileChanged );
fs.watchFile(watchedFile[1], { interval: 1000 }, fileChanged );


