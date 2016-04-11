var fs     = require('fs');
var gulp   = require('gulp');
var concat = require('gulp-concat');
var rename = require('gulp-rename');
var _      = require('lodash');
var merge  = require('merge-stream');
var path   = require('path');

var dotDir = 'src/dotfiles',
    dotFiles = [
      'gitconfig',
      'my.cnf',
      'vimrc',
      'pythonrc'],
    nodotDir = 'src/nodot',
    nodotSubdirs = [
      'scripts',
      'lib'
    ];

var mkdirP = function (dir, subdir) {
  subdir = path.join(dir, subdir);
  if (!fs.existsSync(subdir)) {
    fs.mkdirSync(subdir);
  }
};

var CWD = '.';
var BUILD = 'build';
var LIB = 'lib';

var setupBuildDirs = function () {
  mkdirP(CWD, BUILD);
  mkdirP(path.join(CWD, BUILD), LIB);
};

setupBuildDirs();

var SRC = 'src';
var NODOT = 'nodot';
var NODOT_LIB_SRC = path.join(CWD, SRC, NODOT, LIB);

gulp.task('default', function () {
});
