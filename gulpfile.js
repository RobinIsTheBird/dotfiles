var del    = require('del');
var fs     = require('fs');
var gulp   = require('gulp');
var debug  = require('gulp-debug');
var rename = require('gulp-rename');
var path   = require('path');

var DOTSRC = 'src/dotfiles',
    NODOTSRC = 'src/nodot';

var FILES = true,
    DIRECTORIES = false;
var filterSubs = function (parentDir, byDirectory) {
  return fs.readdirSync(parentDir).filter(
    function (childFile) {
      var isDir = fs.statSync(path.join(parentDir, childFile)).isDirectory();
      return byDirectory ? isDir : !isDir;
    });
};

var CWD = '.';
var BUILD = 'build';
var INSTALL = 'install';
var LIB = 'lib';

gulp.task('clean', function () {
  del([
    INSTALL,
    BUILD
  ]);
});

gulp.task('nodot', function () {
  gulp.src(path.join(NODOTSRC, '**/*.bash')).pipe(
    gulp.dest(BUILD));
});

gulp.task('dotdirectories', function () {
});

gulp.task('dotfiles', function () {
  gulp.src(path.join(DOTSRC, '*'), {
    nodir: true
  }).pipe(rename(function (path) {
    path.basename = '.' + path.basename;
  })).pipe(gulp.dest(BUILD));
});

gulp.task('default', function () {
});
