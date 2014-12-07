# Todo-CLI

#### What is this?

Todo-CLI is a little command line app, written in ruby, which creates a TODO file
in your working directory and also populates it.

#### How can i get it?

To install this app on your machine, type this in your terminal:

```
sudo gem install todo-cli
```
or type:
```
git clone https://github.com/tobiaszwalczak/Todo-CLI.git
cd Todo-CLI
sudo rake install
```

#### How does it work?

If you already installed the app, you can type `todo help` in your terminal.
The result is also shown here:

```
$ todo [command] [task]

   show        => Shows the TODO list
 delete        => Deletes the TODO list
    add [task] => Adds a task (creates file if not available)
     rm [task] => Removes a task (removes file when last task)
  check [task] => Markes a task as done
uncheck [task] => Unmarks a task when already marked

Pro tip: You can match the task 'Do something' with 'Do...'
```
Copyright (c) 2014 Tobiasz Walczak
