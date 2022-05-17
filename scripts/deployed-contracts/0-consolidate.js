const fs = require('fs');
const path = require('path')

const jsonsInDir = fs.readdirSync('./').filter((file) => path.extname(file) === '.json');
let contracts = {}
jsonsInDir.forEach((file) => {
    const fileData = fs.readFileSync(path.join('./', file));
    const json = JSON.parse(fileData.toString());
    contracts = {
        ...contracts, ...json
    }
});

console.log(contracts)