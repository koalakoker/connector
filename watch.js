import { getFileList, getGeneratedFileList } from "./scanDir.js";
import fs from "fs";
import { execFile } from 'child_process';

// Watched file will be all .asy files present in current folder and subfolders
const watchedFile = await getFileList();
// Generated files will be all .asy file (name without extension) present in current folder except config.asy
const onlyName = await getGeneratedFileList();
// watchedFile.forEach(file => {
//   onlyName.push(path.parse(file).name);
// });

console.log(`Watching for file changes`);

function fileChanged(curr, prev) {
  console.log(`file Changed`);

  onlyName.forEach(file => {
    console.log(file);
    execFile('./generate', [file], (err, stdout, stderr) => {
      if (err) {
        console.log(err);
      } else {
        console.log(file + ' generated correctly');
      }
    });
    
  });


}

watchedFile.forEach(file => {
  fs.watchFile(file, { interval: 1000 }, fileChanged);
});




