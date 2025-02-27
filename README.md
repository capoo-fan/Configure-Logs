# Personal Configuration

My Operating System is arch linux and you can install the following software based on your operating system.


## zsh
zsh is a wonderful shell with beautiful themes and useful plugins. It is much better than bash.
And my plugin manmager is zinit whose turbo model is fast and powerful(I love it :smile:).

### theme 
After installing ,what you want to do first is to choose a theme.I recommend you to use [powerlevel10k](https://github.com/romkatv/powerlevel10k) which is a very beautiful theme and has many features.

In my powerlevel10k configuration file, I change the background color and the color of the prompt to make it more beautiful.

![powerlevel10k](screenshoot/powerlevel10k)

### plugin and other configurations

**Zsh** has rich plugins which will improve your workflow and make your life easier.

* zsh-autosuggestions : This plugin will show you the suggestions based on your history.
* zsh-syntax-highlighting : This plugin will highlight the syntax of your command. (you can change the color in the configuration file)
* zsh-vi-mode : This plugin will let you use vim mode in zsh if you are a vim user.

* oh my zsh : If you want to use oh-my-zsh plugin, you can write the following commands into the .zshrc file

```shell
zinit snippet OMZP:: PluginName
```

* command aliasing

you can alias some command in the .zshrc file like this

```shell
alias c="clear"
```

* Built-in features of Zsh

```shell 
setopt autocd # Change directory automatically
setopt correct # Correct errors automatically```
```

* zsh-history

```shell
HISTSIZE=10000  #The maximum number of history records
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE  
HISTDUP=erase #Erase the duplicate history records
setopt appendhistory 
setopt sharehistory #Share your jistory records in other shell

setopt hist_ignore_space

setopt hist_ignore_all_dups # Ignore the duplicate records
setopt hist_ignore_dups  

setopt hist_save_no_dups # Do not restore the duplicate records
setopt hist_find_no_dups # Do not search for duplicate records.
```
### environment variables

```shell
export EDITOR=code       
export VISUAL=code      
export SUDO_EDITOR=code #  set Visual Studio Code as the default editor
export TERMINAL=wezterm # set Visual Studion Code as the default terminal
export FCEDIT=code       
```

## wezterm

