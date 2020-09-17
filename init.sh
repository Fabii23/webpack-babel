#!/bin/sh
TEST_DIR="test"
echo "Attempting to create $(pwd)/${TEST_DIR} folder"

if [ -d  $(pwd)/${TEST_DIR} ] 
then
    echo "Directory already existS"
else
    mkdir test
fi

echo "Jumping into our test directory"
cd ${TEST_DIR}
return

echo "creating .babelrc file"
touch .babelrc


echo '{
  "plugins": ["@babel/plugin-transform-runtime"],
  "presets": [ "@babel/preset-env" ]
}' > .babelrc

echo "creating webpack.config.js file"
touch webpack.config.js


echo 'const path = require("path");

module.exports = {
  mode: "production",
  entry: {
    app: ["./src/index.js"]
  },
  output: {
    path: path.join(__dirname, "dist"),
    filename: "[name].bundle.js"
  },
  module: {
    rules: [
      {
        test: /\.(js)$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "babel-loader",
            options: {
              presets: ["@babel/preset-env"]
            }
          },
        ]
      }
    ]
  }
};' > webpack.config.js


echo "Building package.json file."
touch package.json

echo '{
  "name": "babel-test",
  "version": "1.0.0",
  "description": "Babel : Custom build script",
  "main": "index.js",
  "scripts": {
    "test": "test",
    "build": "webpack --config webpack.config.js"
  },
  "keywords": [
    "Babel",
    "transpiler",
    "test"
  ],
  "author": "Enter your name here.",
  "license": "ISC",
  "dependencies": {
  },
  "devDependencies": {
  }
}' > package.json


echo "Install all require webpack and babel dependencies"

npm install --save-dev webpack webpack-cli 
npm install --save @babel/core 
npm install --save-dev @babel/preset-env 
npm install --save-dev babel-loader  

echo "These packages are required for async/await support"
npm install --save-dev @babel/plugin-transform-runtime
npm install --save @babel/runtime


SRC_DIR="src"
echo "Attempting to create $(pwd)/${src} folder"

if [ -d  $(pwd)/${SRC_DIR} ] 
then
    echo "Directory already exist ${SRC_DIR}"
else
    mkdir src
fi


cd ${SRC_DIR}

echo "Creating index.js file to test babel and webpack transpile"
touch index.js

echo "Adding some dummy code to transpile."

echo  'let x = 2; 
    async function test(){
        console.log("This is a test");
    }
' > index.js


echo "Creating index.js file to test babel and webpack transpile"
touch test.js

echo "Adding some dummy code to transpile."

echo  '
    let arr1 = [1,22,4,4]; 
    let arr2 = [45,...arr1];
' > test.js

echo "Running npm run build"
npm run build

