import { getFileList, getGeneratedFileList } from "./scanDir.js";
import fs from "fs";
import { execFile } from 'child_process';

process.argv.splice(0,2);
const args = process.argv;
if (args.length != 1) {
  console.log("\nUsage node watch.js file\n");
  process.exit(0);
}

// Watched file will be all .asy files present in current folder and subfolders
const watchedFile = await getFileList();
const fileName = args[0];

console.log(`Watching for file changes`);


function fileChanged(curr, prev) {
  console.log(`Source modified`);

  execFile('asy', ['-noV','-o','generated/',fileName], (err, stdout, stderr) => {
    if (err) {
      console.log(err);
    } else {
      console.log(fileName + ' generated correctly');
    }
  });

}

watchedFile.forEach(file => {
  fs.watchFile(file, { interval: 1000 }, fileChanged);
});




