##  Webpack/ Babel file and skeleton dir generator

<hr/>

Run the **init** shell script to get started.

<pre>$ ./init.sh</pre>
<hr/>

Running the shell **init** script will automatically create a 'test' directory with the following : 

- .babelrc 
    - This JSON file tells babel how you want your code to be transpiled. Two important properties are plugins and presets. You can use plugins if you want babel to only transpile specific features, like arrow functions, classes etc. However, it is usually recommended that you have babel transpile everything. You can do this with presets, presets are a collection of babel plugins. For example ES2015 is a plugin that lets you transpile all features of ES2015.
    - The babelrc example in the **test** repo uses **@babel/preset-env**. **@babel/preset-**env** is a smart preset that allows you to use the latest JavaScript without needing to micromanage which syntax transforms (and optionally, browser polyfills) are needed by your target environment(s). More info [here](https://babeljs.io/docs/en/babel-preset-env) .

- webpack.config.js
    - This is the brains of the operation, it holds all the configurations that points to the source files, destination files, along with specific rules  determining which files to exclude, and presets to use.

- package.json 
    - A JSON file that holds the configuration for your project and list of all npm dependencies, along with scripts to build or run your application.

- package-lock.json
    - package-lock.json is automatically generated for any operations where npm modifies either the node_modules tree, or package.json. It describes the exact tree that was generated, such that subsequent installs are able to generate identical trees, regardless of intermediate dependency updates. More info [here](https://docs.npmjs.com/files/package-lock.json) .

- src
    - Folder with a sample file containing ES6 that will transpiled.

- dist
    -  Folder with transpiled output file from the **src** folder.

- node_modules
    - All npm node modules required for the magic to happen.

