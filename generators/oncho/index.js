'use strict';

const Generator = require('yeoman-generator');

// const baseRootPath = path.resolve(__dirname, 'app/templates');

module.exports = class extends Generator {
  async prompting() {
  //   const answers = await this.prompt([
  //     {
  //       type: 'input',
  //       name: 'name',
  //       message: 'Please enter the database name',
  //       default: this.appname
  //     },
  //     // {
  //     //   type: 'input',
  //     //   name: 'version',
  //     //   message: 'Please enter the version of your project',
  //     //   default: '0.1.0'
  //     // },
  //     // {
  //     //   type: 'input',
  //     //   name: 'author',
  //     //   message: 'Please enter the author of your project'
  //     // },
  //     // {
  //     //   type: 'input',
  //     //   name: 'licence',
  //     //   message: 'Please enter the licence of your project',
  //     //   default: 'MIT'
  //     // }
  //   ]);

  //   this.log('project name', answers.name);
  //   // // Set needed global vars for yo
  //   this.name = answers.name;
  //   this.version = answers.version;
  //   this.author = answers.author;
  }

  writing() {
    // const packageSettings = {
    //   ...this.fs.readJSON(this.templatePath('package.json')),
    //   name: this.name,
    //   version: this.version,
    //   author: this.author,
    //   licence: this.licence
    // };
    this.fs.copyTpl(this.templatePath('**'), this.destinationPath(), {
      title: 'this.name'
    });

    // this.fs.writeJSON(this.destinationPath('package.json'), packageSettings);
  }

  // install() {
  //   this.yarnInstall();
  // }
};
