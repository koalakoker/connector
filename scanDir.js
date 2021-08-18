import { walk } from "@root/walk";
import path from "path";
import fs from 'fs';

const root = "./";
const filesList = [];
const generatedList = [];

const walkFunc = async (err, pathname, dirent) => {
  if (err) {
    throw err;
  }

  if (dirent.isDirectory() && dirent.name.startsWith(".")) {
    return false;
  }

  if (path.parse(root + pathname).ext == '.asy') {
    filesList.push(root + pathname);
  }
};

export async function getFileList() {
  await walk(root, walkFunc);
  return(filesList);
}

export function getGeneratedFileList() {
  return new Promise((resolve,reject) => {
    fs.readdir(root, (err, files) => {
      files.forEach(file => {
        const parsedFile = path.parse(file);
        if ((parsedFile.ext == '.asy') &&
          (file != 'config.asy')) {
          generatedList.push(parsedFile.name);
        }
      });
      resolve(generatedList);
    });

  })
}
