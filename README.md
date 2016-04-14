# dotfiles

## Install Instructions

1. Download ZIP
2. __$__ `cd $HOME`
3. __$__ `unzip _download.zip_`
4. __$__ `bash scripts/setup_new_computer.bash`
5. move `lib/bashrc/robin-Lenovo-G51-35.bash` to lib/bashrc/$(hostname).bash
6. move `lib/profile/robin-Lenovo-G51-35.bash` to lib/profile/$(hostname).bash
7. add "`. $HOME/lib/bashrc/localrc.bash`" to your .bashrc
8. add "`. $HOME/lib/profile/localrc.bash`" to your .bash_profile
9. logout and log back in

## Build Instructions

1. Install gulp-cli globally, and gulp locally as a dev dependency.
See https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md.
2. __$__ `git clone https://github.com/RobinIsTheBird/dotfiles.git`
3. __$__ `cd dotfiles`
4. __$__ `npm install`
5. __$__ `gulp`

If you make changes after running gulp,
I recommend gulp clean before the next gulp.
