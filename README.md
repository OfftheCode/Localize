## Usage

If You manage dependencies with Gemfile use
```bash
  $ bundle exec ruby localize.rb
```
Else just type
```bash
  $ ruby localize.rb
```

## Configuration

  You can pass 2 arguments on cmd.
  **First** is **source** path
  **Second** is **output** path

  If no output is specified it outpus to same direcotry as localize.rb

  If source directory is not specified program will exit but You can change PROJECT_USAGE flag to true and specify default path for it. You can also set the output path there so everything is done autmaticlly.
