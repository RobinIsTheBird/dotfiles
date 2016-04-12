var del    = require('del');
var fs     = require('fs');
var gulp   = require('gulp');
var gzip   = require('gulp-gzip');
var rename = require('gulp-rename');
var tar    = require('gulp-tar');
var path   = require('path');
var runSeq = require('run-sequence');

var DOT = 'dotfiles',
    NODOT = 'nodot',
    DOTSRC = path.join('src', DOT),
    NODOTSRC = path.join('src', NODOT);

var BUILD = 'build';
var DIST = 'dist';

gulp.task('clean', function () {
  del([
    DIST,
    BUILD
  ]);
});

gulp.task(NODOT, function () {
  var stream = gulp.src(path.join(NODOTSRC, '**/*.bash'))
      .pipe(gulp.dest(BUILD));
  return stream;
});

gulp.task(DOT, function () {
  var stream = gulp.src([
    path.join(DOTSRC, '*'),
    path.join(DOTSRC, '**/*')
  ], {dot: true})
      .pipe(rename(function (path) {
        if (path.dirname !== '.') {
          path.dirname = '.' + path.dirname;
        } else {
          path.basename = '.' + path.basename;
        }
      }))
      .pipe(gulp.dest(BUILD));
  return stream;
});

gulp.task(BUILD, [NODOT, DOT]);

gulp.task('archive', function () {
  var stream = gulp.src([
    path.join(BUILD, '*'),
    path.join(BUILD, '**/*')
  ], {dot: true})
      .pipe(tar('dotfiles.tar'))
      .pipe(gzip())
      .pipe(gulp.dest(DIST));
  return stream;
});

gulp.task('default', function () {
  runSeq([NODOT, DOT], 'archive');
});
