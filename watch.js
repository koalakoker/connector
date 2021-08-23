import { getFileList, getAllFileList } from "./scanDir.js";
import fs from "fs";
import { execFile } from 'child_process';

process.argv.splice(0,2);
const args = process.argv;
if (args.length != 1) {
  console.log("\nUsage:\nnode watch.js file.asy, or\nnode watch.js -all\n");
  process.exit(0);
}

// Watched file will be all .asy files present in current folder and subfolders
const watchedFile = await getFileList();
let fileName = [];
if (args[0] == '-all') {
  fileName = await getAllFileList();
} else {
  fileName.push(args[0]);
}

let totNumberOfFiles = fileName.length;
let generatedCorrectly = 0;

generation();

console.log(`Watching for file changes`);

function generation() {
  console.log('Output generation');
  
  fileName.forEach(element => {
    execFile('asy', ['-noV', '-o', 'generated/', element], (err, stdout, stderr) => {
      if (err) {
        console.log(err);
      } else {
        generatedCorrectly++;
        console.log(element + ' processed correctly. (' + generatedCorrectly + '/' + totNumberOfFiles + ')');
      }
    });
  });

}

function fileChanged(curr, prev) {
  console.log(`Source modified`);
  generation();
}

watchedFile.forEach(file => {
  fs.watchFile(file, { interval: 1000 }, fileChanged);
});